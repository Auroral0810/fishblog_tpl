package com.Auroral.blog.consumer;

import com.alibaba.fastjson.JSON;
import com.Auroral.blog.dto.SmsDTO;
import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.sms.v20210111.SmsClient;
import com.tencentcloudapi.sms.v20210111.models.SendSmsRequest;
import com.tencentcloudapi.sms.v20210111.models.SendSmsResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import static com.Auroral.blog.constant.MQPrefixConst.SMS_QUEUE;

/**
 * 短信消费者（腾讯云实现）
 */
@Slf4j
@Component
@RabbitListener(queues = SMS_QUEUE)
public class SmsConsumer {

//    @Value("${tencent.sms.secret-id}")
//    private String secretId;
//
//    @Value("${tencent.sms.secret-key}")
//    private String secretKey;
//
//    @Value("${tencent.sms.sdk-app-id}")
//    private String sdkAppId;
//
//    @Value("${tencent.sms.sign-name}")
//    private String signName;
//
//    @Value("${tencent.sms.template-id}")
//    private String templateId;

    @RabbitHandler
    public void process(byte[] data) {
        SmsDTO smsDTO = JSON.parseObject(new String(data), SmsDTO.class);
        try {
            sendSms(smsDTO.getPhone(), smsDTO.getContent());
        } catch (Exception e) {
            log.error("短信发送失败: {}", e.getMessage());
        }
    }

    /**
     * 发送短信
     *
     * @param phone 手机号
     * @param content 短信内容
     */
    private void sendSms(String phone, String content) {
//        将随机生成的验证码直接输出
//        发送的逻辑：        // 发送验证码
//        SmsDTO smsDTO = SmsDTO.builder()
//                .phone(username)
//                .content("您的验证码为 " + code.toString() + " 有效期15分钟，请不要告诉他人哦！")
//                .build();
        System.out.println(content);
//        try {
//            // 从内容中提取验证码
//            String code = content.replaceAll("\\D+", "");
//
//            // 实例化一个认证对象
//            Credential cred = new Credential(secretId, secretKey);
//
//            // 实例化一个http选项，可选的，没有特殊需求可以跳过
//            HttpProfile httpProfile = new HttpProfile();
//            httpProfile.setEndpoint("sms.tencentcloudapi.com");
//
//            // 实例化一个client选项，可选的，没有特殊需求可以跳过
//            ClientProfile clientProfile = new ClientProfile();
//            clientProfile.setHttpProfile(httpProfile);
//
//            // 实例化要请求产品的client对象，clientProfile是可选的
//            SmsClient client = new SmsClient(cred, "ap-guangzhou", clientProfile);
//
//            // 实例化一个请求对象，每个接口都会对应一个request对象
//            SendSmsRequest req = new SendSmsRequest();
//
//            // 填充请求参数
//            String[] phoneNumberSet = {"+86" + phone};
//            req.setPhoneNumberSet(phoneNumberSet);
//            req.setSmsSdkAppId(sdkAppId);
//            req.setSignName(signName);
//            req.setTemplateId(templateId);
//
//            String[] templateParamSet = {code};
//            req.setTemplateParamSet(templateParamSet);
//
//            // 发送短信
//            SendSmsResponse resp = client.SendSms(req);
//
//            // 处理响应
//            if (!"Ok".equals(resp.getSendStatusSet()[0].getCode())) {
//                log.error("短信发送失败 - phone: {}, code: {}, message: {}",
//                        phone, resp.getSendStatusSet()[0].getCode(),
//                        resp.getSendStatusSet()[0].getMessage());
//                throw new RuntimeException("短信发送失败：" + resp.getSendStatusSet()[0].getMessage());
//            }
//
//            log.info("短信发送成功 - phone: {}, serialNo: {}",
//                    phone, resp.getSendStatusSet()[0].getSerialNo());
//
//        } catch (TencentCloudSDKException e) {
//            log.error("腾讯云短信发送异常: {}", e.getMessage());
//            throw new RuntimeException("短信发送失败", e);
//        }
    }
}