package com.Auroral.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 留言列表
 * @author Auroral
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MessageDTO {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 留言内容
     */
    private String messageContent;

    /**
     * 弹幕速度
     */
    private Integer time;

}
