package com.me7eorite.bbs.controller.admin;

import com.me7eorite.bbs.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName: BkController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2023/1/27 15:43
 * @Version: V1.0
 */
@Controller("bkController")
@RequestMapping(value = "/admin/bk")
public class BkController extends BaseController {
    @RequestMapping("/list")
    public String list(Model model, HttpServletRequest request){
        String sql = "select a.* from t_bk a where 1=1";
        if(request.getParameter("bkName")!=null && request.getParameter("bkName").equals("")){
            sql+=" and bkName like '%"+request.getParameter("bkName")+"%'";
        }
        sql+=" order by id desc";
        List list = db.queryForList(sql);
        request.setAttribute("list",list);
        return "admin/bk/list";
    }
    @RequestMapping("/frame")
    public String frame(Model model, HttpServletRequest request){

        return "admin/bk/frame";
    }

}
