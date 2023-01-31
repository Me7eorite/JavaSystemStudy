package com.me7eorite.bbs.controller.admin;

import com.me7eorite.bbs.util.StringHelper;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: AdminController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2020/1/25 16:39
 * @Version: V1.0
 */
@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends AdminBaseController{
    /*
     * @Author me7eorite
     * @Description 后台主页面视图
     * @Date 17:52 2020/1/25
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/index")
    public String index(){
        return "admin/index";
    }

    /*
     * @Author me7eorite
     * @Description 后台main页面视图
     * @Date 17:53 2020/1/25
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/main")
    public String main(){
        return "admin/main";
    }
    /*
     * @Author me7eorite
     * @Description 进入修改密码页面
     * @Date 18:18 2020/1/25
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/password")
    public String changePwd(){
        return "admin/password";
    }
    /*
     * @Author me7eorite
     * @Description 修改密码
     * @Date 18:26 2020/1/25
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/changepwd")

    /*
     * @Author me7eorite
     * @Description 修改密码
     * @Date 13:54 2023/1/27
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    public ResponseEntity<String> changePwd(Model model, HttpServletRequest request){
        Map admin = getAdmin(request);

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        boolean status = false;

        if (oldPassword.equals(admin.get("password").toString())){
            String sql = "update t_admin set password=? where id=?";
            db.update(sql,new Object[]{newPassword,admin.get("id")});
            status = true;
        }

        return renderData(status,"1",null);
    }

}
