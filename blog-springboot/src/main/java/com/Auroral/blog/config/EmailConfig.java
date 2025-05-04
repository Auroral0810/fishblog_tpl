package com.Auroral.blog.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "spring.mail")
public class EmailConfig {
    /**
     * 邮箱服务器地址
     */
    private String host;

    /**
     * 邮箱账号
     */
    private String username;

    /**
     * 邮箱授权码/密码
     */
    private String password;

    /**
     * 邮箱端口
     */
    private Integer port;

    /**
     * 默认编码
     */
    private String defaultEncoding;
}
