package com.Auroral.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: Auroral
 * @date: 2021-03-30
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WebsocketMessageDTO {

    /**
     * 类型
     */
    private Integer type;

    /**
     * 数据
     */
    private Object data;

}
