package com.me7eorite.controller;

import com.me7eorite.entity.User;
import com.me7eorite.service.UserService;
import com.me7eorite.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author Me7eorite
 * @Date 2021/12/21 23:44
 * @Description
 */
@RestController
@RequestMapping("test")
public class TestController {
    @Autowired
    private UserService userService;
    @RequestMapping("index")
    public String hello(){
        return "home";
    }
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public User queryUser(String stuid){
        System.out.println(stuid);
        return this.userService.queryUserById(stuid);
    }

}
