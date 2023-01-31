package com.me7eorite.bbs.controller.admin;

import com.me7eorite.bbs.controller.BaseController;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: AdminCustomerController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2023/1/27 14:05
 * @Version: V1.0
 */
@Controller("AdminCustomerController")

@RequestMapping(value = "/admin/customer")
public class AdminCustomerController extends BaseController {

    @RequestMapping(value = "/frame")
    public String frame(Model model, HttpServletRequest request){

        return "customer/frame";
    }
    @RequestMapping(value = "/list")
    public String list(Model model,HttpServletRequest request){
        String username = request.getParameter("username");
        String sql = "select a.* from t_custom a where 1=1";
        List list = null;
        if(username !=null && !username.equals("")){
            sql+=" and username like '%"+username+"%' order by id desc";

        }
        list = db.queryForList(sql);

        if(list !=null && list.size()!=0) {
            request.setAttribute("list", list);

        }
        return "/customer/list";
    }

    @RequestMapping(value = "/edit")
    public String edit(Model model,HttpServletRequest request,Long id){

        if (id!=null){
            String sql = "select * from t_custom where id=?";
            Map map = db.queryForMap(sql,new Object[]{id});
            model.addAttribute("map",map);
        }
        return "/customer/edit";
    }

    @RequestMapping(value = "/editSave")
    public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id){
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String idcard = request.getParameter("idcard");
        String isft = request.getParameter("isft");
        String ispl = request.getParameter("ispl");
        String level = request.getParameter("level");
        String yzm = request.getParameter("yzm");

        int result = 0;
        if(id!=null){
            String sql1 = "update t_custom set password=?,name=?,phone=?,sex=?,age=?,address=?,idcard=?,isft=?,ispl=?,level=? where id=?";
            result = db.update(sql1,new Object[]{password,name,phone,sex,age,address,idcard,isft,ispl,level,id});
        }else{
            String sql2 = "insert into t_custom(username,name,password,phone,sex,age,address,idcard,isft,ispl,level) " +
                    "values(?,?,?,?,?,?,?,?,?,?,?)";
            result = db.update(sql2,new Object[]{username,name,password,phone,sex,age,address,idcard,isft,ispl,level});
        }
        if (result==1){
            return renderData(true,"操作成功",null);
        }else{
            return renderData(false,"操作失败",null);
        }
    }
}
