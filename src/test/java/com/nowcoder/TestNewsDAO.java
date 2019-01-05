package com.nowcoder;

import com.nowcoder.model.News;
import com.nowcoder.model.User;
import com.nowcoder.model.ViewObject;
import com.nowcoder.service.NewsService;
import com.nowcoder.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = ToutiaoApplication.class)
public class TestNewsDAO {

    @Autowired
    private NewsService newsService;

    @Autowired
    private UserService userService;
    @Test
    public void getNews() {
        List<News> newsList = newsService.getLatestNews(0, 0, 10);

//        List<ViewObject> vos = new ArrayList<>();
//        for (News news : newsList) {
//            ViewObject vo = new ViewObject();
//            vo.set("news", news);
//            vo.set("user", userService.getUser(news.getUserId()));
////            if (localUserId != 0) {
////                vo.set("like", likeService.getLikeStatus(localUserId, EntityType.ENTITY_NEWS, news.getId()));
////            } else {
////                vo.set("like", 0);
////            }
//            vos.add(vo);
//        }
        System.out.println(newsList);
    }


}
