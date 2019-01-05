package com.nowcoder.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    //log  日志
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping(path = {"/","/index"})
    @ResponseBody
    public String index(HttpSession session){
        logger.info("Visit Index");

        return "hello nowcoder ,"+session.getAttribute("msg");
    }

    @RequestMapping(path = {"/profile/{userId}"})
    @ResponseBody
    public String profile(@PathVariable("userId") int userId,
                          @RequestParam(value = "type",defaultValue = "0") int type,
                          @RequestParam(value = "key",defaultValue = "nowcoder") String key){

        return String.format("{%d},{%d},{%s}",userId,type,key);
    }

    @RequestMapping(path = "/ftl")
    public String veloc(){

        return "news";
    }

    //强制跳转
    @RequestMapping("/redirect/{code}")
    public RedirectView redirect(@PathVariable("code") int code,
                                 HttpSession session){

        //跳转到访问首页的url   localhost:8080/
        RedirectView redirectView = new RedirectView("/",true);

        if (code == 301){
            //强制性有永久转移
            redirectView.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
        }

        session.setAttribute("msg","Jump from redirect");
        return redirectView;
    }


    @RequestMapping("/admin")
    @ResponseBody
    public String admin(@RequestParam(value = "key",required = false) String key){
        if ("admin".equals(key)){
            return "hello admin";

        }
        throw new IllegalArgumentException("key 错误");
    }


    @ExceptionHandler()
    @ResponseBody
    public String error(Exception e){

        return "error: "+e.getMessage();
    }
}
