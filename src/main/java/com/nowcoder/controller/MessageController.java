package com.nowcoder.controller;

import com.nowcoder.model.*;
import com.nowcoder.service.*;
import com.nowcoder.util.ToutiaoUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by nowcoder on 2016/7/2.
 */
@Controller
public class MessageController {
    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

    @Autowired
    HostHolder hostHolder;

    @Autowired
    UserService userService;

    @Autowired
    MessageService messageService;

    //根据conversationId 查询出通信内容
    @RequestMapping(path = {"/msg/detail"}, method = {RequestMethod.GET})
    public String conversationDetail(Model model, @RequestParam("conversationId") String conversationId) {
        try {
            List<ViewObject> messages = new ArrayList<>();
            //根据通信双方的id查询出来通信的内容
            List<Message> messageList = messageService.getConversationDetail(conversationId, 0, 10);
            //遍历所有通信内容
            for (Message msg : messageList) {
                ViewObject vo = new ViewObject();
                vo.set("message", msg);
                //将发送消息的人的名字头像展示出来
                User user = userService.getUser(msg.getFromId());
                if (user == null) {
                    continue;
                }
                vo.set("headUrl", user.getHeadUrl());
                vo.set("userName", user.getName());
                messages.add(vo);
            }
            model.addAttribute("messages", messages);
            return "letterDetail";
        } catch (Exception e) {
            logger.error("获取站内信列表失败" + e.getMessage());
        }
        return "letterDetail";
    }

    //获取站内信列表
    @RequestMapping(path = {"/msg/list"}, method = {RequestMethod.GET})
    public String conversationList(Model model) {
        try {
            //获取登陆用户的id
            int localUserId = hostHolder.getUser().getId();
            List<ViewObject> conversations = new ArrayList<>();
            List<Message> messageList = messageService.getConversationList(localUserId, 0, 10);
            for (Message msg : messageList) {
                ViewObject vo = new ViewObject();
                vo.set("conversation", msg);
                //判断消息是别人发给我的还是我发给别人的，如果是我发出去的，那目标id是toId
                int targetId = msg.getFromId() == localUserId ? msg.getToId() : msg.getFromId();
                //根据targetId获取和我通信的用户是谁
                User user = userService.getUser(targetId);
                vo.set("user",user);
//                vo.set("headUrl", user.getHeadUrl());
//                vo.set("userName", user.getName());
//                vo.set("targetId", targetId);
//                vo.set("totalCount", msg.getId());
                vo.set("unreadCount", messageService.getUnreadCount(localUserId, msg.getConversationId()));
                conversations.add(vo);
            }
            model.addAttribute("conversations", conversations);
            return "letter";
        } catch (Exception e) {
            logger.error("获取站内信列表失败 ---" + e.getMessage());
        }
        return "letter";
    }

    //往数据库中插入数据，可以调用postman发送请求
    @RequestMapping(path = {"/msg/addMessage"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String addMessage(@RequestParam("fromId") int fromId,
                                   @RequestParam("toId") int toId,
                                   @RequestParam("content") String content) {
        Message msg = new Message();
        msg.setContent(content);
        msg.setCreatedDate(new Date());
        msg.setToId(toId);
        msg.setFromId(fromId);
        //  message的会话id，把用户id小的放在前面，比如 2_12
        msg.setConversationId(fromId < toId ? String.format("%d_%d", fromId, toId) :
                String.format("%d_%d", toId, fromId));
        messageService.addMessage(msg);
        return ToutiaoUtil.getJSONString(msg.getId());
    }
}
