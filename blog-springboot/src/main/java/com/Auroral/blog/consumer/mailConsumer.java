package com.Auroral.blog.consumer;

import com.Auroral.blog.config.EmailConfig;
import com.Auroral.blog.dto.EmailDTO;
import com.Auroral.blog.dto.SmsDTO;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import static com.Auroral.blog.constant.MQPrefixConst.EMAIL_QUEUE;
import static com.Auroral.blog.constant.MQPrefixConst.SMS_QUEUE;

/**
 * 邮箱发送验证码消费者（QQ邮箱实现）
 */
@Slf4j
@Component
@RabbitListener(queues = EMAIL_QUEUE)
public class mailConsumer {
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private EmailConfig emailConfig;

    @RabbitHandler
    public void process(byte[] data) {
        EmailDTO emailDTO = JSON.parseObject(new String(data), EmailDTO.class);
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            // 设置发件人
            message.setFrom(emailConfig.getUsername());
            // 设置收件人
            message.setTo(emailDTO.getEmail());
            //邮件主题
            message.setSubject(emailDTO.getSubject());
            //邮件内容
            message.setText(emailDTO.getContent());

            javaMailSender.send(message);
            log.info("邮件发送成功: {}", emailDTO.getEmail());
        } catch (Exception e) {
            log.error("邮件发送失败: {}", e.getMessage());
        }
    }
}

