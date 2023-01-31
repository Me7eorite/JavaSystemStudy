package com.me7eorite.controller;

import com.me7eorite.entity.Device;
import com.me7eorite.entity.User;
import com.me7eorite.service.impl.DeviceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/25 0:15
 * @Description 获取用户的基本信息
 */
@Controller
@RequestMapping("user")
public class UserController {

    @RequestMapping("info")
    public String userInformation(Model model, HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        return "page/userinfo.html";
    }
    @RequestMapping("welcome")
    public String welcomeIndex(Model model,HttpServletRequest request)
    {

        return "page/welcome.html";
    }




}
