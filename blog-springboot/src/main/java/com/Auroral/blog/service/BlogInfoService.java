package com.Auroral.blog.service;

import com.Auroral.blog.dto.BlogBackInfoDTO;
import com.Auroral.blog.dto.BlogHomeInfoDTO;

/**
 * 博客信息服务
 * @author Auroral
 * @since 2020-05-18
 */
public interface BlogInfoService {

    /**
     * 获取首页数据
     * @return 博客首页信息
     */
    BlogHomeInfoDTO getBlogInfo();

    /**
     * 获取后台首页数据
     * @return 博客后台信息
     */
    BlogBackInfoDTO getBlogBackInfo();

    /**
     * 获取关于我内容
     * @return 关于我内容
     */
    String getAbout();

    /**
     * 修改关于我内容
     * @param aboutContent 关于我内容
     */
    void updateAbout(String aboutContent);

    /**
     * 修改公告
     * @param notice 公告
     */
    void updateNotice(String notice);

    /**
     * 后台查看公告
     * @return 公告
     */
    String getNotice();
}