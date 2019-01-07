package com.nowcoder.service;

import com.nowcoder.dao.NewsDAO;
import com.nowcoder.model.News;

import com.nowcoder.util.ToutiaoUtil;
import org.apache.tomcat.util.http.fileupload.FileUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by nowcoder on 2016/7/2.
 */
@Service
public class NewsService {
    @Autowired
    private NewsDAO newsDAO;

    public List<News> getLatestNews(int userId, int offset, int limit) {

        //在这个地方不用xml配置mapper.xml，总是出错
        //在这个地方使用if判断，根据用户id查询新闻，如果用户id等于0，就查出所有的int offset到 int limit的新闻信息
        //如果用户id不等于0，就查询出对应用户id的新闻
        List<News> newsList = new ArrayList<>();
        if (userId != 0){
            newsList = newsDAO.selectByUserIdAndOffset(userId, offset, limit);
        }else {
            newsList = newsDAO.selectByUserListAndOffset(userId, offset, limit);
        }


        return newsList;
    }

    public int addNews(News news) {
        newsDAO.addNews(news);
        return news.getId();
    }

    //根据id查询新闻
    public News getById(int newsId) {
        return newsDAO.getById(newsId);
    }

    //上传文件
    public String saveImage(MultipartFile file) throws IOException {
        //获得xxx.jpg文件 " . "的索引位置
        int dotPos = file.getOriginalFilename().lastIndexOf(".");
        if (dotPos < 0) {
            return null;
        }
        //获得文件的后缀名，
        String fileExt = file.getOriginalFilename().substring(dotPos + 1).toLowerCase();
        //判断上传图片的扩展名是不是一个图片，如果不符合图片扩展名返回null
        if (!ToutiaoUtil.isFileAllowed(fileExt)) {
            return null;
        }

        //随机生成文件名
        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + "." + fileExt;
        Files.copy(file.getInputStream(), new File(ToutiaoUtil.IMAGE_DIR + fileName).toPath(),
                StandardCopyOption.REPLACE_EXISTING);
        return ToutiaoUtil.TOUTIAO_DOMAIN + "image?name=" + fileName;
    }

    //上传多张图片
    public String saveImages(MultipartFile[] files) throws IOException {
        StringBuffer sb = new StringBuffer();
        for (MultipartFile file : files) {
            String fileUrl = saveImage(file);

            sb.append(fileUrl + ",");
        }
        return sb.toString();
    }

    //更新每个新闻资讯的评论数
    public int updateCommentCount(int id, int count) {
        return newsDAO.updateCommentCount(id, count);
    }

    public int updateLikeCount(int id, int count) {
        return newsDAO.updateLikeCount(id, count);
    }
}
