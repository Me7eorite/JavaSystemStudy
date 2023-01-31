package com.me7eorite.controller;

import com.me7eorite.entity.User;
import com.me7eorite.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author Me7eorite
 * @Date 2021/12/24 23:39
 * @Description 登录控制器
 */
@Controller
public class LoginController {
    @Autowired
    private UserMapper userMapper;
    @GetMapping("login")
    public String login(){
        return "page/login.html";
    }
    @PostMapping("login")
    public String toLogin(Model model, HttpServletRequest request,String username,String password){
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();

        try{
            subject.login(token);
            User user = this.userMapper.queryUserByName(username);
            request.getSession().setAttribute("user",user);
            model.addAttribute("uname",user.getUname());
            request.getSession().setAttribute("rname",user.getRname());
            System.out.println("123");
            return "page/index.html";

        } catch(AuthenticationException e){
            return "page/login.html";
        }
    }
    @RequestMapping("logout")
    public String logout(){
        return "login.html";
    }


}
