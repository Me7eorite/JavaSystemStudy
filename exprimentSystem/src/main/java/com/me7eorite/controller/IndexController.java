package com.me7eorite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Me7eorite
 * @Date 2021/12/24 22:03
 * @Description 首页控制器
 */
@Controller
public class IndexController {
    @RequestMapping("index")
    public String index(){
    return "index.html";
}
}
