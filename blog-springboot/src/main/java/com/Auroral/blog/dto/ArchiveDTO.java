package com.Auroral.blog.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 归档文章
 * @author Auroral
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArchiveDTO {
    /**
     * id
     */
    private Integer id;

    /**
     * 标题
     */
    private String articleTitle;

    /**
     * 发表时间
     */
    private Date createTime;

}
