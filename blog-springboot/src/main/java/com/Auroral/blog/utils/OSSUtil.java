package com.Auroral.blog.utils;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Objects;

/**
 * OSS工具类
 *
 * @author Auroral
 */
@Component
public class OSSUtil {

    private static String url;

    private static String endpoint;

    private static String accessKeyId;

    private static String accessKeySecret;

    private static String bucketName;

    @Value("${aliyun.url}")
    public void setUrl(String url) {
        OSSUtil.url = url;
    }

    @Value("${aliyun.endpoint}")
    public void setEndpoint(String endpoint) {
        OSSUtil.endpoint = endpoint;
    }

    @Value("${aliyun.accessKeyId}")
    public void setAccessKeyId(String accessKeyId) {
        OSSUtil.accessKeyId = accessKeyId;
    }

    @Value("${aliyun.accessKeySecret}")
    public void setAccessKeySecret(String accessKeySecret) {
        OSSUtil.accessKeySecret = accessKeySecret;
    }

    @Value("${aliyun.bucketName}")
    public void setBucketName(String bucketName) {
        OSSUtil.bucketName = bucketName;
    }

    /**
     * 上传图片
     *
     * @param file       文件
     * @param targetAddr 目标路径
     * @return
     */
    public static String upload(MultipartFile file, String targetAddr) {
        // 获取不重复的随机名
        String fileName = String.valueOf(IdWorker.getId());
        // 获取文件的扩展名如png,jpg等
        String extension = getFileExtension(Objects.requireNonNull(file.getOriginalFilename()));
        // 获取文件存储的相对路径(带文件名)
        String relativeAddr = targetAddr + fileName + extension;
        try {
            // 创建OSSClient实例
            OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
            // 上传文件
            ossClient.putObject(bucketName, relativeAddr, file.getInputStream());
            // 关闭OSSClient。
            ossClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 修改返回的URL格式
        if (!url.startsWith("https://") && !url.startsWith("http://")) {
            url = "https://" + url;
        }
        // 确保URL末尾有/
        if (!url.endsWith("/")) {
            url = url + "/";
        }
        // 移除relativeAddr开头的/以避免双斜杠
        if (relativeAddr.startsWith("/")) {
            relativeAddr = relativeAddr.substring(1);
        }
//        System.out.println(url + relativeAddr);
        return url + relativeAddr;
    }

    /**
     * 获取输入文件流的扩展名
     *
     * @param fileName
     * @return
     */
    private static String getFileExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

}
