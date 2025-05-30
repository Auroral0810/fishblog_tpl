package com.Auroral.blog.service.impl;

import com.alibaba.fastjson.JSON;
import com.Auroral.blog.dto.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.google.common.collect.Lists;
import com.Auroral.blog.constant.CommonConst;
import com.Auroral.blog.dao.RoleDao;
import com.Auroral.blog.dao.UserInfoDao;
import com.Auroral.blog.dao.UserRoleDao;
import com.Auroral.blog.entity.UserInfo;
import com.Auroral.blog.entity.UserAuth;
import com.Auroral.blog.dao.UserAuthDao;
import com.Auroral.blog.entity.UserRole;
import com.Auroral.blog.enums.LoginTypeEnum;
import com.Auroral.blog.enums.RoleEnum;
import com.Auroral.blog.exception.ServeException;
import com.Auroral.blog.service.UserAuthService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.Auroral.blog.utils.IpUtil;
import com.Auroral.blog.utils.UserUtil;
import com.Auroral.blog.vo.ConditionVO;
import com.Auroral.blog.vo.PasswordVO;
import com.Auroral.blog.vo.UserVO;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

import static com.Auroral.blog.constant.MQPrefixConst.EMAIL_EXCHANGE;
import static com.Auroral.blog.constant.MQPrefixConst.SMS_EXCHANGE;
import static com.Auroral.blog.constant.RedisPrefixConst.CODE_EXPIRE_TIME;
import static com.Auroral.blog.constant.RedisPrefixConst.CODE_KEY;
import static com.Auroral.blog.utils.CommonUtil.checkEmail;
import static com.Auroral.blog.utils.CommonUtil.checkPhone;
import static com.Auroral.blog.utils.UserUtil.convertLoginUser;

/**
 * @author Auroral
 * @since 2020-05-18
 */
@Service
public class UserAuthServiceImpl extends ServiceImpl<UserAuthDao, UserAuth> implements UserAuthService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private UserAuthDao userAuthDao;
    @Autowired
    private UserRoleDao userRoleDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private RestTemplate restTemplate;
    @Resource
    private HttpServletRequest request;
    @Autowired
    private RabbitTemplate rabbitTemplate;

    /**
     * 邮箱号
     */
    @Value("${spring.mail.username}")
    private String email;

    /**
     * qq appId
     */
    @Value("${qq.app-id}")
    private String QQ_APP_ID;

    /**
     * qq获取用户信息接口地址
     */
    @Value("${qq.user-info-url}")
    private String QQ_USER_INFO_URL;

    /**
     * 微博appId
     */
    @Value("${weibo.app-id}")
    private String WEIBO_APP_ID;

    /**
     * 微博appSecret
     */
    @Value("${weibo.app-secret}")
    private String WEIBO_APP_SECRET;

    /**
     * 微博授权方式
     */
    @Value("${weibo.grant-type}")
    private String WEIBO_GRANT_TYPE;

    /**
     * 微博回调地址
     */
    @Value("${weibo.redirect-url}")
    private String WEIBO_REDIRECT_URI;

    /**
     * 微博获取token和openId接口地址
     */
    @Value("${weibo.access-token-url}")
    private String WEIBO_ACCESS_TOKEN_URI;

    /**
     * 微博获取用户信息接口地址
     */
    @Value("${weibo.user-info-url}")
    private String WEIBO_USER_INFO_URI;
    /**
     * 获取github授权的app-id
     * */
    @Value("${github.app-id}")
    private String GITHUB_APP_ID;
    /**
     * 获取github授权的密钥*/
    @Value("${github.app-secret}")
    private String GITHUB_APP_SECRET;
    /**
     * github回调地址
     */
    @Value("${github.redirect-url}")
    private String GITHUB_REDIRECT_URI;
    /**
     * github获取token和openId接口地址
     */
    @Value("${github.access-token-url}")
    private String GITHUB_ACCESS_TOKEN_URI;
    /**
     * github获取用户信息接口地址
     */
    @Value("${github.user-info-url}")
    private String GITHUB_USER_INFO_URI;
    @Value("${qq.redirect-uri}")
    private String QQ_REDIRECT_URI;
    @Value("${qq.app-secret}")
    private String QQ_APP_SECRET;
    @Value("${qq.token-url}")
    private String QQ_TOKEN_URL;
    @Value("${qq.openid-url}")
    private String QQ_OPENID_URL;
    @Override
    public void sendCode(String username) {
        // 校验账号是否合法
        if (!checkEmail(username)) {
            throw new ServeException("请输入正确邮箱");
        }
        // 生成六位随机验证码发送
        StringBuilder code = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            code.append(random.nextInt(10));
        }
        // 发送验证码
        EmailDTO emailDTO = EmailDTO.builder()
                .email(username)
                .subject("验证码")
                .content("您的验证码为 " + code.toString() + " 有效期15分钟，请不要告诉他人哦！")
                .build();
        rabbitTemplate.convertAndSend(EMAIL_EXCHANGE, "*", new Message(JSON.toJSONBytes(emailDTO), new MessageProperties()));
        // 将验证码存入redis，设置过期时间为15分钟
        redisTemplate.boundValueOps(CODE_KEY + username).set(code);
        redisTemplate.expire(CODE_KEY + username, CODE_EXPIRE_TIME, TimeUnit.MILLISECONDS);
    }

    @Override
    public void sendSmsCode(String username) {
// 校验账号是否合法
        if (!checkPhone(username)) {
            throw new ServeException("请输入正确手机号");
        }
        // 生成六位随机验证码发送
        StringBuilder code = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            code.append(random.nextInt(10));
        }

        // 发送验证码
        SmsDTO smsDTO = SmsDTO.builder()
                .phone(username)
                .content("您的验证码为 " + code.toString() + " 有效期15分钟，请不要告诉他人哦！")
                .build();

        // 发送到消息队列
        rabbitTemplate.convertAndSend(SMS_EXCHANGE, "*", new Message(JSON.toJSONBytes(smsDTO), new MessageProperties()));

        // 将验证码存入redis，设置过期时间为15分钟
        redisTemplate.boundValueOps(CODE_KEY + username).set(code.toString());
        redisTemplate.expire(CODE_KEY + username, CODE_EXPIRE_TIME, TimeUnit.MILLISECONDS);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveUser(UserVO user) {
        // 校验账号是否合法
        if (checkUser(user)) {
            throw new ServeException("该账号已被注册！");
        }

        // 判断是邮箱还是手机号
        boolean isPhone = Pattern.compile("^1[3-9]\\d{9}$").matcher(user.getUsername()).matches();

        // 新增用户信息
        UserInfo userInfo = UserInfo.builder()
                // 根据类型设置email或phone字段
                .email(isPhone ? null : user.getUsername())
                .phone(isPhone ? user.getUsername() : null)
                .nickname(CommonConst.DEFAULT_NICKNAME)
                .avatar(CommonConst.DEFAULT_AVATAR)
                .createTime(new Date())
                .build();
        userInfoDao.insert(userInfo);

        // 绑定用户角色
        saveUserRole(userInfo);

        // 新增用户账号
        UserAuth userAuth = UserAuth.builder()
                .userInfoId(userInfo.getId())
                .username(user.getUsername())// $2a$10$FKhj8Hv638OZxthl02QPa.gGgXNqpkxYRcXXBJPITQybiWLcSp8h2
                .password(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()))
                .createTime(new Date())
                // 根据类型设置登录类型
                .loginType(isPhone ? LoginTypeEnum.PHONE.getType() : LoginTypeEnum.EMAIL.getType())
                .build();
        userAuthDao.insert(userAuth);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updatePassword(UserVO user) {
        if (!checkUser(user)) {
            throw new ServeException("该账号尚未注册！");
        }
        // 根据用户名修改密码
        userAuthDao.update(new UserAuth(), new LambdaUpdateWrapper<UserAuth>()
                .set(UserAuth::getPassword, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()))
                .eq(UserAuth::getUsername, user.getUsername()));
    }

//            // 校验账号是否合法
//        if (!checkUser(user)) {
//            throw new ServeException("该账号尚未注册！");
//        }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateAdminPassword(PasswordVO passwordVO) {
        // 查询旧密码是否正确
        UserAuth user = userAuthDao.selectOne(new LambdaQueryWrapper<UserAuth>()
                .eq(UserAuth::getId, UserUtil.getLoginUser().getId()));
        // 正确则修改密码，错误则提示不正确
        if (Objects.nonNull(user) && BCrypt.checkpw(passwordVO.getOldPassword(), user.getPassword())) {
            UserAuth userAuth = UserAuth.builder()
                    .id(UserUtil.getLoginUser().getId())
                    .password(BCrypt.hashpw(passwordVO.getNewPassword(), BCrypt.gensalt()))
                    .build();
            userAuthDao.updateById(userAuth);
        } else {
            throw new ServeException("旧密码不正确");
        }
    }

    @Override
    public PageDTO<UserBackDTO> listUserBackDTO(ConditionVO condition) {
        // 转换页码
        condition.setCurrent((condition.getCurrent() - 1) * condition.getSize());
        // 获取后台用户数量
        Integer count = userAuthDao.countUser(condition);
        if (count == 0) {
            return new PageDTO<>();
        }
        // 获取后台用户列表
        List<UserBackDTO> userBackDTOList = userAuthDao.listUsers(condition);
        return new PageDTO<>(userBackDTOList, count);
    }



    @Transactional(rollbackFor = Exception.class)
    @Override
    public UserInfoDTO qqLogin(String openId, String accessToken) {
        // 创建登录信息
        UserInfoDTO userInfoDTO;
        // 校验该第三方账户信息是否存在
        UserAuth user = getUserAuth(openId, LoginTypeEnum.QQ.getType());
        if (Objects.nonNull(user) && Objects.nonNull(user.getUserInfoId())) {
            // 存在则返回数据库中的用户信息登录封装
            userInfoDTO = getUserInfoDTO(user);
        } else {
            // 不存在通过openId和accessToken获取QQ用户信息，并创建用户
            Map<String, String> formData = new HashMap<>(16);
            // 定义请求参数
            formData.put("openid", openId);
            formData.put("access_token", accessToken);
            formData.put("oauth_consumer_key", QQ_APP_ID);
            // 获取QQ返回的用户信息
            Map<String, String> userInfoMap = JSON.parseObject(restTemplate.getForObject(QQ_USER_INFO_URL, String.class, formData), Map.class);
            // 获取ip地址
            String ipAddr = IpUtil.getIpAddr(request);
            String ipSource = IpUtil.getIpSource(ipAddr);
            // 将用户账号和信息存入数据库
            UserInfo userInfo = convertUserInfo(Objects.requireNonNull(userInfoMap).get("nickname"), userInfoMap.get("figureurl_qq_1"));
            userInfoDao.insert(userInfo);
            UserAuth userAuth = convertUserAuth(userInfo.getId(), openId, accessToken, ipAddr, ipSource, LoginTypeEnum.QQ.getType());
            userAuthDao.insert(userAuth);
            // 绑定角色
            saveUserRole(userInfo);
            // 封装登录信息
            userInfoDTO = convertLoginUser(userAuth, userInfo, Lists.newArrayList(RoleEnum.USER.getLabel()), null, null, request);
        }
        // 将登录信息放入springSecurity管理
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userInfoDTO, null, userInfoDTO.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return userInfoDTO;
    }

    /**
     * 绑定用户角色
     *
     * @param userInfo 用户信息
     */
    private void saveUserRole(UserInfo userInfo) {
        UserRole userRole = UserRole.builder()
                .userId(userInfo.getId())
                .roleId(RoleEnum.USER.getRoleId())
                .build();
        userRoleDao.insert(userRole);
    }

    @Transactional(rollbackFor = ServeException.class)
    @Override
    public UserInfoDTO weiBoLogin(String code) {
        // 创建登录信息
        UserInfoDTO userInfoDTO;
        // 用code换取accessToken和uid
        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        // 定义请求参数
        formData.add("client_id", WEIBO_APP_ID);
        formData.add("client_secret", WEIBO_APP_SECRET);
        formData.add("grant_type", WEIBO_GRANT_TYPE);
        formData.add("redirect_uri", WEIBO_REDIRECT_URI);
        formData.add("code", code);
        // 构建参数体
        HttpEntity<MultiValueMap> requestEntity = new HttpEntity<>(formData, null);
        // 获取accessToken和uid
        Map<String, String> result = restTemplate.exchange(WEIBO_ACCESS_TOKEN_URI, HttpMethod.POST, requestEntity, Map.class).getBody();
        String uid = Objects.requireNonNull(result).get("uid");
        String accessToken = result.get("access_token");
        // 校验该第三方账户信息是否存在
        UserAuth user = getUserAuth(uid, LoginTypeEnum.WEIBO.getType());
        if (Objects.nonNull(user) && Objects.nonNull(user.getUserInfoId())) {
            // 存在则返回数据库中的用户信息封装
            userInfoDTO = getUserInfoDTO(user);
        } else {
            // 不存在则用accessToken和uid换取微博用户信息，并创建用户
            Map<String, String> data = new HashMap<>(16);
            // 定义请求参数
            data.put("uid", uid);
            data.put("access_token", accessToken);
            // 获取微博用户信息
            Map<String, String> userInfoMap = restTemplate.getForObject(WEIBO_USER_INFO_URI, Map.class, data);
            // 获取ip地址
            String ipAddr = IpUtil.getIpAddr(request);
            String ipSource = IpUtil.getIpSource(ipAddr);
            // 将账号和信息存入数据库
            UserInfo userInfo = convertUserInfo(Objects.requireNonNull(userInfoMap).get("screen_name"), userInfoMap.get("profile_image_url"));
            userInfoDao.insert(userInfo);
            UserAuth userAuth = convertUserAuth(userInfo.getId(), uid, accessToken, ipAddr, ipSource, LoginTypeEnum.WEIBO.getType());
            userAuthDao.insert(userAuth);
            // 绑定角色
            saveUserRole(userInfo);
            // 封装登录信息
            userInfoDTO = convertLoginUser(userAuth, userInfo, Lists.newArrayList(RoleEnum.USER.getLabel()), null, null, request);
        }
        // 将登录信息放入springSecurity管理
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userInfoDTO, null, userInfoDTO.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return userInfoDTO;
    }
    @Transactional(rollbackFor = ServeException.class)
    @Override
    public UserInfoDTO githubLogin(String code) {
        // 创建登录信息
        UserInfoDTO userInfoDTO;

        try {
            // 用code换取accessToken
            MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
            // 定义请求参数
            formData.add("client_id", GITHUB_APP_ID);
            formData.add("client_secret", GITHUB_APP_SECRET);
            formData.add("code", code);
            formData.add("redirect_uri", GITHUB_REDIRECT_URI);

            // 设置请求头，要求返回JSON格式
            HttpHeaders headers = new HttpHeaders();
            headers.set("Accept", "application/json");

            // 构建请求实体
            HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(formData, headers);

            // 发送请求获取accessToken
            Map<String, String> result = restTemplate.exchange(
                    GITHUB_ACCESS_TOKEN_URI,
                    HttpMethod.POST,
                    requestEntity,
                    Map.class
            ).getBody();

            if (result == null || !result.containsKey("access_token")) {
                throw new ServeException("GitHub授权失败，未获取到access_token");
            }

            String accessToken = result.get("access_token");

            // 使用accessToken获取用户信息
            HttpHeaders userInfoHeaders = new HttpHeaders();
            userInfoHeaders.set("Authorization", "token " + accessToken);
            userInfoHeaders.set("Accept", "application/json");

            HttpEntity<String> userInfoRequestEntity = new HttpEntity<>(null, userInfoHeaders);

            // 获取GitHub用户信息
            Map<String, Object> userInfoMap = restTemplate.exchange(
                    GITHUB_USER_INFO_URI,
                    HttpMethod.GET,
                    userInfoRequestEntity,
                    Map.class
            ).getBody();

            if (userInfoMap == null || !userInfoMap.containsKey("id")) {
                throw new ServeException("获取GitHub用户信息失败");
            }

            // 获取GitHub的唯一标识
            String githubId = userInfoMap.get("id").toString();

            // 校验该第三方账户信息是否存在
            UserAuth user = getUserAuth(githubId, LoginTypeEnum.GITHUB.getType());

            if (Objects.nonNull(user) && Objects.nonNull(user.getUserInfoId())) {
                // 存在则返回数据库中的用户信息封装
                userInfoDTO = getUserInfoDTO(user);
            } else {
                // 不存在则创建新用户
                // 获取ip地址
                String ipAddr = IpUtil.getIpAddr(request);
                String ipSource = IpUtil.getIpSource(ipAddr);

                // 获取用户昵称和头像
                String nickname = userInfoMap.containsKey("name") && userInfoMap.get("name") != null ?
                        userInfoMap.get("name").toString() :
                        "github_" + githubId;

                String avatar = userInfoMap.containsKey("avatar_url") ?
                        userInfoMap.get("avatar_url").toString() :
                        CommonConst.DEFAULT_AVATAR;

                // 获取用户邮箱（如果有权限的话）
                String email = userInfoMap.containsKey("email") && userInfoMap.get("email") != null ?
                        userInfoMap.get("email").toString() : null;

                // 创建用户信息
                UserInfo userInfo = UserInfo.builder()
                        .nickname(nickname)
                        .avatar(avatar)
                        .email(email)
                        .createTime(new Date())
                        .build();

                userInfoDao.insert(userInfo);

                // 创建用户账号
                UserAuth userAuth = UserAuth.builder()
                        .userInfoId(userInfo.getId())
                        .username(githubId)
                        .password(accessToken)
                        .loginType(LoginTypeEnum.GITHUB.getType())
                        .ipAddr(ipAddr)
                        .ipSource(ipSource)
                        .createTime(new Date())
                        .lastLoginTime(new Date())
                        .build();

                userAuthDao.insert(userAuth);

                // 绑定角色
                saveUserRole(userInfo);

                // 封装登录信息
                userInfoDTO = convertLoginUser(userAuth, userInfo, Lists.newArrayList(RoleEnum.USER.getLabel()), null, null, request);
            }

            // 将登录信息放入springSecurity管理
            UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userInfoDTO, null, userInfoDTO.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(auth);

            return userInfoDTO;
        } catch (Exception e) {
            throw new ServeException("GitHub登录异常: " + e.getMessage());
        }
    }
    /**
     * 封装用户信息
     *
     * @param nickname 昵称
     * @param avatar   头像
     * @return 用户信息
     */
    private UserInfo convertUserInfo(String nickname, String avatar) {
        return UserInfo.builder()
                .nickname(nickname)
                .avatar(avatar)
                .createTime(new Date())
                .build();
    }

    /**
     * 封装用户账号
     *
     * @param userInfoId  用户信息id
     * @param uid         唯一Id标识
     * @param accessToken 登录凭证
     * @param ipAddr      ip地址
     * @param ipSource    ip来源
     * @param loginType   登录方式
     * @return 用户账号
     */
    private UserAuth convertUserAuth(Integer userInfoId, String uid, String accessToken, String ipAddr, String ipSource, Integer loginType) {
        return UserAuth.builder()
                .userInfoId(userInfoId)
                .username(uid)
                .password(accessToken)
                .loginType(loginType)
                .ipAddr(ipAddr)
                .ipSource(ipSource)
                .createTime(new Date())
                .lastLoginTime(new Date())
                .build();
    }

    /**
     * 获取本地第三方登录信息
     *
     * @param user 用户对象
     * @return 用户登录信息
     */
    private UserInfoDTO getUserInfoDTO(UserAuth user) {
        // 更新登录时间，ip
        String ipAddr = IpUtil.getIpAddr(request);
        String ipSource = IpUtil.getIpSource(ipAddr);
        userAuthDao.update(new UserAuth(), new LambdaUpdateWrapper<UserAuth>()
                .set(UserAuth::getLastLoginTime, new Date())
                .set(UserAuth::getIpAddr, ipAddr)
                .set(UserAuth::getIpSource, ipSource)
                .eq(UserAuth::getId, user.getId()));
        // 查询账号对应的信息
        UserInfo userInfo = userInfoDao.selectOne(new LambdaQueryWrapper<UserInfo>()
                .select(UserInfo::getId, UserInfo::getEmail, UserInfo::getNickname, UserInfo::getAvatar, UserInfo::getIntro, UserInfo::getWebSite, UserInfo::getIsDisable)
                .eq(UserInfo::getId, user.getUserInfoId()));
        // 查询账号点赞信息
        Set<Integer> articleLikeSet = (Set<Integer>) redisTemplate.boundHashOps("article_user_like").get(userInfo.getId().toString());
        Set<Integer> commentLikeSet = (Set<Integer>) redisTemplate.boundHashOps("comment_user_like").get(userInfo.getId().toString());
        // 查询账号角色
        List<String> roleList = roleDao.listRolesByUserInfoId(userInfo.getId());
        // 封装信息
        return convertLoginUser(user, userInfo, roleList, articleLikeSet, commentLikeSet, request);
    }


    /**
     * 检测第三方账号是否注册
     *
     * @param openId    第三方唯一id
     * @param loginType 登录方式
     * @return 用户账号信息
     */
    private UserAuth getUserAuth(String openId, Integer loginType) {
        // 查询账号信息
        return userAuthDao.selectOne(new LambdaQueryWrapper<UserAuth>()
                .select(UserAuth::getId, UserAuth::getUserInfoId, UserAuth::getLoginType)
                .eq(UserAuth::getUsername, openId)
                .eq(UserAuth::getLoginType, loginType));
    }


    /**
     * 校验用户数据是否合法
     *
     * @param user 用户数据
     * @return 合法状态
     */
    private Boolean checkUser(UserVO user) {
        if (!user.getCode().equals(redisTemplate.boundValueOps(CODE_KEY + user.getUsername()).get())) {
            throw new ServeException("验证码错误！");
        }

        // 查询用户名是否存在
        UserAuth userAuth = userAuthDao.selectOne(new LambdaQueryWrapper<UserAuth>()
                .select(UserAuth::getUsername)
                .eq(UserAuth::getUsername, user.getUsername()));

        return Objects.nonNull(userAuth);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public UserInfoDTO qqLoginByCode(String code) {
        try {
            // 第一步：用code换取access_token
            Map<String, String> tokenParams = new HashMap<>();
            tokenParams.put("grant_type", "authorization_code");
            tokenParams.put("client_id", QQ_APP_ID);
            tokenParams.put("client_secret", QQ_APP_SECRET);
            tokenParams.put("code", code);
            tokenParams.put("redirect_uri", QQ_REDIRECT_URI);
            
            String tokenUrl = createUrlWithParams(QQ_TOKEN_URL, tokenParams);
            String tokenResponse = restTemplate.getForObject(tokenUrl, String.class);
            
            // 解析access_token响应
            if (tokenResponse == null || tokenResponse.contains("error")) {
                throw new ServeException("获取QQ access_token失败: " + tokenResponse);
            }
            
            Map<String, String> tokenMap = parseResponse(tokenResponse);
            String accessToken = tokenMap.get("access_token");
            
            if (accessToken == null) {
                throw new ServeException("未能从响应中获取access_token");
            }
            
            // 第二步：使用access_token获取openid和unionid
            Map<String, String> openidParams = new HashMap<>();
            openidParams.put("access_token", accessToken);
            openidParams.put("unionid", "1"); // 请求unionid
            openidParams.put("fmt", "json"); // 使用json格式返回
            
            String openidUrl = createUrlWithParams(QQ_OPENID_URL, openidParams);
            String openidResponse = restTemplate.getForObject(openidUrl, String.class);
            
            if (openidResponse == null || openidResponse.contains("error")) {
                throw new ServeException("获取QQ openid失败: " + openidResponse);
            }
            
            // 解析openid和unionid
            Map<String, Object> openidMap = JSON.parseObject(openidResponse, Map.class);
            String openid = (String) openidMap.get("openid");
            String unionid = (String) openidMap.get("unionid");
            
            if (openid == null) {
                throw new ServeException("未能从响应中获取openid");
            }
            
            // 第三步：获取用户信息
            Map<String, String> userInfoParams = new HashMap<>();
            userInfoParams.put("access_token", accessToken);
            userInfoParams.put("oauth_consumer_key", QQ_APP_ID);
            userInfoParams.put("openid", openid);
            
            String userInfoResponse = restTemplate.getForObject(
                QQ_USER_INFO_URL + "?access_token={access_token}&oauth_consumer_key={oauth_consumer_key}&openid={openid}",
                String.class,
                userInfoParams
            );
            
            Map<String, Object> userInfoMap = JSON.parseObject(userInfoResponse, Map.class);
            
            // 使用unionid优先，如果没有则使用openid
            String userId = unionid != null ? unionid : openid;
            
            // 检查数据库是否已存在此用户
            UserAuth user = getUserAuth(userId, LoginTypeEnum.QQ.getType());
            
            if (Objects.nonNull(user) && Objects.nonNull(user.getUserInfoId())) {
                // 用户存在，返回用户信息
                return getUserInfoDTO(user);
            } else {
                // 用户不存在，创建新用户
                String nickname = (String) userInfoMap.get("nickname");
                String avatar = (String) userInfoMap.get("figureurl_qq_2"); // 100x100头像
                if (avatar == null || avatar.isEmpty()) {
                    avatar = (String) userInfoMap.get("figureurl_qq_1"); // 40x40头像
                }
                
                // 获取ip地址
                String ipAddr = IpUtil.getIpAddr(request);
                String ipSource = IpUtil.getIpSource(ipAddr);
                
                // 创建用户信息
                UserInfo userInfo = UserInfo.builder()
                    .nickname(nickname)
                    .avatar(avatar)
                    .createTime(new Date())
                    .build();
                userInfoDao.insert(userInfo);
                
                // 创建用户认证信息
                UserAuth userAuth = UserAuth.builder()
                    .userInfoId(userInfo.getId())
                    .username(userId) // 使用unionid或openid作为用户名
                    .password(accessToken)
                    .loginType(LoginTypeEnum.QQ.getType())
                    .ipAddr(ipAddr)
                    .ipSource(ipSource)
                    .createTime(new Date())
                    .lastLoginTime(new Date())
                    .build();
                userAuthDao.insert(userAuth);
                
                // 绑定用户角色
                saveUserRole(userInfo);
                
                // 返回登录信息
                return convertLoginUser(userAuth, userInfo, Lists.newArrayList(RoleEnum.USER.getLabel()), null, null, request);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServeException("QQ登录处理失败: " + e.getMessage());
        }
    }

    /**
     * 解析URL编码的响应
     */
    private Map<String, String> parseResponse(String response) {
        Map<String, String> result = new HashMap<>();
        String[] pairs = response.split("&");
        for (String pair : pairs) {
            String[] keyValue = pair.split("=");
            if (keyValue.length == 2) {
                result.put(keyValue[0], keyValue[1]);
            }
        }
        return result;
    }

    /**
     * 创建带参数的URL
     */
    private String createUrlWithParams(String baseUrl, Map<String, String> params) {
        StringBuilder sb = new StringBuilder(baseUrl);
        if (!params.isEmpty()) {
            sb.append("?");
            for (Map.Entry<String, String> entry : params.entrySet()) {
                sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            sb.deleteCharAt(sb.length() - 1); // 删除最后的&
        }
        return sb.toString();
    }
}
