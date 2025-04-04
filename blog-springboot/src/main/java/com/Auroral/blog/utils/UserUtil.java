package com.Auroral.blog.utils;

import com.Auroral.blog.dto.UserInfoDTO;
import com.Auroral.blog.entity.UserAuth;
import com.Auroral.blog.entity.UserInfo;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.security.core.context.SecurityContextHolder;
import com.alibaba.fastjson.JSON;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * 用户工具类
 *
 * @author Auroral
 */
public class UserUtil {

    /**
     * 获取当前登录用户
     *
     * @return 用户登录信息
     */
    public static UserInfoDTO getLoginUser() {
        try {
            // 获取用户身份信息
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            
            // 判断类型
            if (principal instanceof UserInfoDTO) {
                return (UserInfoDTO) principal;
            } else if (principal instanceof String) {
                // 如果是字符串，尝试将其解析为JSON并转换为UserInfoDTO
                try {
                    return JSON.parseObject(principal.toString(), UserInfoDTO.class);
                } catch (Exception e) {
                    throw new RuntimeException("用户未登录或登录状态异常");
                }
            } else {
                throw new RuntimeException("用户未登录或登录状态异常");
            }
        } catch (Exception e) {
            throw new RuntimeException("用户未登录或登录状态异常");
        }
    }

    /**
     * 封装用户登录信息
     *
     * @param user           用户账号
     * @param userInfo       用户信息
     * @param articleLikeSet 点赞文章id集合
     * @param commentLikeSet 点赞评论id集合
     * @param request        请求
     * @return 用户登录信息
     */
    public static UserInfoDTO convertLoginUser(UserAuth user, UserInfo userInfo, List<String> roleList, Set<Integer> articleLikeSet, Set<Integer> commentLikeSet, HttpServletRequest request) {
        // 获取登录信息
        String ipAddr = IpUtil.getIpAddr(request);
        String ipSource = IpUtil.getIpSource(ipAddr);
        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        // 封装权限集合
        return UserInfoDTO.builder()
                .id(user.getId())
                .loginType(user.getLoginType())
                .userInfoId(userInfo.getId())
                .username(user.getUsername())
                .password(user.getPassword())
                .email(userInfo.getEmail())
                .roleList(roleList)
                .nickname(userInfo.getNickname())
                .avatar(userInfo.getAvatar())
                .intro(userInfo.getIntro())
                .webSite(userInfo.getWebSite())
                .articleLikeSet(articleLikeSet)
                .commentLikeSet(commentLikeSet)
                .ipAddr(ipAddr)
                .ipSource(ipSource)
                .browser(userAgent.getBrowser().getName())
                .os(userAgent.getOperatingSystem().getName())
                .lastLoginTime(new Date())
                .build();
    }

}
