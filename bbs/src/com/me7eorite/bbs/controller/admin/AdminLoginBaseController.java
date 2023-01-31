package com.me7eorite.bbs.controller.admin;

import com.me7eorite.bbs.util.Consts;
import com.me7eorite.bbs.util.StringHelper;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller("adminLoginController")  //通过注解可以访问到controller
@RequestMapping(value="/adminLogin")
public class AdminLoginBaseController extends AdminBaseController {
    /*
     * @Author me7eorite
     * @Description 访问登陆界面
     * @Date 15:46 2020/1/25
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/login")
    public String index(){
        return "admin/login";
    }
    /*
     * @Author me7eorite
     * @Description //TODO
     * @Date 16:21 2020/1/25
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/save")
    public ResponseEntity<String> loginSave(Model model, HttpServletRequest request){
       String username = request.getParameter("username");
       String password = request.getParameter("password");
       String sql = "select * from t_admin where username=?";
       List<Map> list = db.queryForList(sql,new Object[]{username});
       String result = "0";
       if (list!=null && list.size()>0){
           Map map = list.get(0);
           if(StringHelper.get(map,"password").equals(password)){
               request.getSession().setMaxInactiveInterval(60*60);
               request.getSession().setAttribute(Consts.ADMIN_NAME,map);
               result = "1";
           }else {
               result = "0";
           }
       }
        return renderData(true,result,null);
    }
    @RequestMapping(value = "/out")
    public String out(HttpServletRequest request){
        request.getSession().removeAttribute(Consts.ADMIN_NAME);
        return "redirect:/adminLogin/login.html";
    }

}
