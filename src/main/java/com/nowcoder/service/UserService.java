package com.nowcoder.service;

import com.nowcoder.dao.LoginTicketDAO;
import com.nowcoder.dao.UserDAO;

import com.nowcoder.model.LoginTicket;
import com.nowcoder.model.User;

import com.nowcoder.util.ToutiaoUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.provider.MD5;

import java.util.*;

/**
 * Created by 周杰伦 on 2018/5/3.
 */
@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LoginTicketDAO loginTicketDAO;

    //注册用户，注册成功之后给这个用户添加一个ticket，在controller层将这个ticket添加到cookie里面
    public Map<String, Object> register(String userName, String password) {
        Map<String, Object> map = new HashMap<>();
        if (StringUtils.isBlank(userName)) {
            map.put("msg", "用户名不能为空");
            return map;
        }
        if (StringUtils.isBlank(password)) {
            map.put("msg", "密码不能为空");
            return map;
        }
        User user = userDAO.selectByName(userName);
        if (user != null) {
            map.put("msg", "用户名已被注册");
            return map;
        }

        //用户名检验，敏感词，特殊符号等
        //密码强度
        user = new User();
        user.setName(userName);
        //生成一段字符加在用户设置的密码后面，使得解密网站解密不到用户设置的密码，提高安全性
        user.setSalt(UUID.randomUUID().toString().substring(0, 5));
        user.setHeadUrl(String.format("http://images.nowcoder.com/head/%dt.png",new Random().nextInt(1000)));
        user.setPassword(ToutiaoUtil.MD5(password + user.getSalt()));
        userDAO.addUser(user);

        //传入ticket，也就是登录成功
        String ticket = addLoginTicket(user.getId());
        map.put("ticket", ticket);
        return map;
    }

    public Map<String, Object> login(String userName, String password) {
        Map<String, Object> map = new HashMap<>();
        if (StringUtils.isBlank(userName)) {
            map.put("msg", "用户名不能为空");
            return map;
        }
        if (StringUtils.isBlank(password)) {
            map.put("msg", "密码不能为空");
            return map;
        }
        User user = userDAO.selectByName(userName);
        if (user == null) {
            map.put("msg", "用户名不存在");
            return map;
        }
        if (!user.getPassword().equals(ToutiaoUtil.MD5(password + user.getSalt()))) {
            map.put("msg", "密码错误");
            return map;
        }
        //传入ticket，也就是登录成功
        String ticket = addLoginTicket(user.getId());
        map.put("ticket", ticket);
        return map;
    }


    //生成ticket的方法
    private String addLoginTicket(int userId) {
        LoginTicket ticket = new LoginTicket();
        ticket.setUserId(userId);
        Date date = new Date();
        date.setTime(date.getTime() + 1000*3600*24);
        ticket.setExpired(date);
        ticket.setStatus(0);

        //给ticket字段加一些随机生成的字符，ticket就是通常所说的token
        ticket.setTicket(UUID.randomUUID().toString().replaceAll("-", ""));
        loginTicketDAO.addTicket(ticket);
        return ticket.getTicket();
    }
//
//
//    public void addUser(User user) {
//        userDAO.addUser(user);
//    }
//
    public User getUser(int id) {
        return userDAO.selectById(id);
    }

    //用户登出
    public void logout(String ticket) {
        loginTicketDAO.updateStatus(ticket, 1);
    }
//
//    public void updateUser(User user) {
//        userDAO.updatePassword(user);
//    }
//
//    public void deleteUser(int userId) {
//        userDAO.deleteById(userId);
//    }

}
