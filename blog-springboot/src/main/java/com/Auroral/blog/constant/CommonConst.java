package com.Auroral.blog.constant;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;

/**
 * 公共常量
 *
 * @author: Auroral
 * @date: 2021-01-29
 **/
public class CommonConst {

    /**
     * 否
     */
    public static final int FALSE = 0;

    /**
     * 是
     */
    public static final int TURE = 1;

    /**
     * 博主id
     */
    public static final int BLOGGER_ID = 1;

    /**
     * 默认用户昵称
     */
    public static final String DEFAULT_NICKNAME = "用户" + IdWorker.getId();

    /**
     * 默认用户头像
     */
    public static final String DEFAULT_AVATAR = "https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png";

    /**
     * 前端组件名
     */
    public static String COMPONENT = "Layout";

    /**
     * 网站域名
     */
    public static final String URL = "https://www.fishblog.yyf040810.com";

    /**
     * 文章页面路径
     */
    public static final String ARTICLE_PATH = "/articles/";

    /**
     * 友联页面路径
     */
    public static final String LINK_PATH = "/links";

}
