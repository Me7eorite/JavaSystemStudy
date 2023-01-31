package com.me7eorite.bbs.controller.front;

import com.me7eorite.bbs.controller.BaseController;
import com.me7eorite.bbs.util.RandomValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName: PublicController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2020/1/27 13:20
 * @Version: V1.0
 */
@Controller("/publicController")
@RequestMapping(value = "/public")
public class PublicController extends BaseController {

    @RequestMapping(value = "/image/validateImg")
    public void validateImg(HttpServletRequest request, HttpServletResponse response){
        //设置返回类型
        response.setContentType("image/jpeg");
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expire",0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        randomValidateCode.getRandcode(request,response);
    }

}
