package com.Auroral.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 分页列表
 * @author Auroral
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageDTO<T> {

    /**
     * 分页列表
     */
    private List<T> recordList;

    /**
     * 总数
     */
    private Integer count;

}
