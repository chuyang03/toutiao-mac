package com.nowcoder.model;

import java.util.Date;

/**
 * login_ticket用来存储ticket字段。该字段在用户登录成功时被生成并存入数据库，并被设置为cookie，
 * 下次用户登录时会带上这个ticket，ticket是随机的uuid，有过期时间以及有效状态。
 */
public class LoginTicket {
    private int id;
    private int userId;
    private Date expired;  //过期时间
    private int status;   // 0有效，1无效
    private String ticket;  //注册或者登陆成功的用户会生成一个ticket来表示该用户

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getExpired() {
        return expired;
    }

    public void setExpired(Date expired) {
        this.expired = expired;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
