package com.me7eorite.bbs.controller.front;

import com.me7eorite.bbs.controller.BaseController;
import com.me7eorite.bbs.util.Consts;
import com.me7eorite.bbs.util.RandomValidateCode;
import com.me7eorite.bbs.util.StringHelper;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * @ClassName: FontController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2020/1/26 14:38
 * @Version: V1.0
 */
@Controller("webController")
@RequestMapping(value = "/front")
public class FontController extends BaseController {
    /*
     * @Author me7eorite
     * @Description 返回注册页面
     * @Date 20:28 2020/1/28
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/register")
    public String register(Model model, HttpServletRequest request){
        return "/front/register";
    }

    /*
     * @Author me7eorite
     * @Description 返回登陆页面
     * @Date 20:29 2020/1/28
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/login")
    public String login(Model model, HttpServletRequest request){
        return "/front/login";
    }

    /*
     * @Author me7eorite
     * @Description 判断用户是否登陆
     * @Date 16:08 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/checkIsLogin")
    public ResponseEntity<String> checkIsLogin(Model model, HttpServletRequest request){
        Map customer = getCustomer(request);
        if (customer!=null){
            return renderData(true,"操作成功",null);
        }else{
            return renderData(false,"操作失败",null);
        }

    }
    /*
     * @Author me7eorite
     * @Description 点赞功能
     * @Date 16:12 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/zanSave")
    public ResponseEntity<String> zanSave(Model model, HttpServletRequest request,Long id){
        String sql = "update t_wdxx set zan=zand+1 where id=?";
        int result = db.update(sql,new Object[]{id});
        if (result==1){
            return renderData(true,"操作成功",null);
        }else{
            return renderData(false,"操作失败",null);
        }

    }


    /*
     * @Author me7eorite
     * @Description 返回首页
     * @Date 16:10 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/index")
    public String index(Model model, HttpServletRequest request){
        Map map = getCustomer(request);
        String sql = "select a.*,(select c.name from t_custom c where c.id=a.costomerId) customerName,"+
                "(select b.bkName from t_bk b where b.id=a.bkId) bkName from t_wdxx a where status='visual' and a.zd='yes' ";
        if(map == null || map.size() == 0){
            sql+=" and a.nologin='yes'";
        }

        sql+=" order by id desc limit "+Consts.INDEX_NUM;
        List<Map> list = db.queryForList(sql);
        model.addAttribute("list",list);

        return "/front/index";
    }


    /*
     * @Author me7eorite
     * @Description 注册功能实现
     * @Date 20:29 2020/1/28
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/registerSave")
    public ResponseEntity<String> registerSave(Model model, HttpServletRequest request){
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String idcard = request.getParameter("idcard");
        String headPic = request.getParameter("headPic");
        String mb1 = request.getParameter("mb1");
        String mb2 = request.getParameter("mb2");
        String mb3 = request.getParameter("mb3");
        String yzm = request.getParameter("yzm");
        String sql1 = "select * from t_custom where username='"+username+"'";
        String msg = "2";
        boolean status = false;
        //判断验证码是否正确
        if(!yzm.toUpperCase().equals(request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY).toString().toUpperCase())){
            return renderData(false,"1",null);
        }

        List<Map> list1 = db.queryForList(sql1);
        if (list1 != null && list1.size() == 0){
            String sql2 = "insert into t_custom(username,name,password,phone,sex,age,address,idcard,headPic,mb1,mb2,mb3) " +
                    "values(?,?,?,?,?,?,?,?,?,?,?,?)";
            db.update(sql2,new Object[]{username,name,password,phone,sex,age,address,idcard,headPic,mb1,mb2,mb3});
            msg="1";
            status = true;
        }
        return renderData(status,msg,null);
    }

    /*
     * @Author me7eorite
     * @Description 前端登陆功能
     * @Date 20:49 2020/1/28
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/save")
    public ResponseEntity<String> loginSave(Model model, HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sql = "select * from t_custom where username=?";
        List<Map> list = db.queryForList(sql,new Object[]{username});
        String result = "0";
        if (list!=null && list.size()>0){
            Map map = list.get(0);
            if(StringHelper.get(map,"password").equals(password)){
                request.getSession().setMaxInactiveInterval(60*60);
                request.getSession().setAttribute(Consts.CUSTOMER_BEAN,map);
                result = "1";
            }else {
                result = "0";
            }
        }
        return renderData(true,result,null);
    }

    /*
     * @Author me7eorite
     * @Description 查看我自己的帖子
     * @Date 20:50 2020/1/28
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/wdxxList")
    public String wdxxList(Model model, HttpServletRequest request){
        Map map = getCustomer(request);
        if(map == null || map.size() == 0){
            return "front/index";
        }

        String sql = "select a.*,(select c.name from t_custom c where c.id=a.costomerId) customerName,"+
                "(select b.bkName from t_bk b where b.id=a.bkId) bkName from t_wdxx a where status='visual' ";
        sql+=" and a.costomerId="+map.get("id");
        sql+=" order by id desc";
        List<Map> list = db.queryForList(sql);
        model.addAttribute("list",list);
        bkList(request);
        return "front/wdxxList";
    }

    /*
     * @Author me7eorite
     * @Description 发布或者修改我的帖子
     * @Date 19:53 2020/1/29
     * @Param
     * @return
     **/
    @RequestMapping(value = "/wdxxEdit")
    public String wdxxEdit(Model model, HttpServletRequest request,Long id){

        if(id!=null) {		//修改
            String sql = "select * from t_wdxx where id=?";
            Map map = db.queryForMap(sql,new Object[] {id});
            model.addAttribute("map", map);
            System.out.println(map);
        }

        bkList(request);
        return "/front/wdxxEdit";
    }
    /*
     * @Author me7eorite
     * @Description 发布新的帖子
     * @Date 19:57 2020/1/29
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/wdxxEditSave")
    public ResponseEntity<String> wdxxEditSave(Model model, HttpServletRequest request, Long id,Integer bkId){


        int costomerId = (int) getCustomer(request).get("id");
        String title = request.getParameter("title");
        String pic = request.getParameter("pic");
        String content = request.getParameter("content");
        String nologin = request.getParameter("nologin");
        String types = request.getParameter("types");

        int result = 0 ;

        if (id == null){
            String sql = "insert into  t_wdxx(costomerId,title,pic,content,nologin,bkId,status,types) values(?,?,?,?,?,?,?,?)";
            result =  db.update(sql,new Object[]{costomerId,title,pic,content,nologin,bkId,"visual",types});
        }else{
            String sql = "update t_wdxx set title=?,pic=?,content=?,nologin=?,bkId=?,types=? where id=?";
            result = db.update(sql,new Object[]{title,pic,content,nologin,bkId,types,id});
        }
        if(result==1){
            return renderData(true,"保存成功",null);
        }else{
            return renderData(false,"保存失败",null);
        }
    }
    /*
     * @Author me7eorite
     * @Description 删除帖子
     * @Date 15:51 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/wdxxDelete")
    public ResponseEntity<String> wdxxDelete(Model model, HttpServletRequest request, Long id){
        String sql = "delete from t_wdxx where id=?";
        int result = db.update(sql,new Object[]{id});
        if (result ==1){
        return  renderData(true,"删除成功",null);
        }else{
            return renderData(false,"删除失败",null);
        }
    }
    /*
     * @Author me7eorite
     * @Description 进入论坛
     * @Date 15:51 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/luntan")
    public String luntan(Model model, HttpServletRequest request, Long id,String searchName,String bkId){
        Map map = getCustomer(request);

        String sql = "select a.*,(select c.name from t_custom c where c.id=a.costomerId) customerName,"+
                "(select b.bkName from t_bk b where b.id=a.bkId) bkName from t_wdxx a where status='visual' and a.zd='yes' ";

        if(map == null || map.size() == 0){
            sql+=" and a.nologin='yes'";
        }
        if(searchName!=null && !searchName.equals(""))
        {
            sql+=" and a.title like '%"+searchName+"%' ";
        }
        if(bkId!=null && !bkId.equals(""))
        {
            sql+=" and a.bkId = "+bkId+" ";
        }
        sql+=" order by id desc";

        List<Map> list  = db.queryForList(sql);
        model.addAttribute("list",list);
        bkList(request);
        return "front/luntan";
    }


    /*
     * @Author me7eorite
     * @Description 进入帖子详细信息页面
     * @Date 16:03 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long, java.lang.String, java.lang.String]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/wdxxShow")
    public String wdxxShow(Model model, HttpServletRequest request, Long id,String searchName,String bkId) {
        String sql = "select a.*,(select c.name from t_custom c where c.id=a.costomerId) customerName,"+
                "(select b.bkName from t_bk b where b.id=a.bkId) bkName from t_wdxx a where status='visual' and a.id=? ";
        Map map  = db.queryForMap(sql,new Object[]{id});
        model.addAttribute("map",map);

        String sql2 = "select a.*,(select c.name from t_custom c where c.id=a.customerId) customerName,(select c.headPic from t_custom c where c.id = a.customerId) headPic from t_pinglun a where a.wdxxId=?";
        List list = db.queryForList(sql2,new Object[]{id});
        model.addAttribute("list",list);
        return "front/wdxxShow";
    }
    /*
     * @Author me7eorite
     * @Description  评论提交
     * @Date 17:18 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long, java.lang.String]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping("/pinglunSave")
    public ResponseEntity<String> pinglunSave(Model model,HttpServletRequest request,Long wdxxId,String content){
        String sql = "insert into t_pinglun(wdxxId,customerId,content) values(?,?,?)";
        int result = db.update(sql,new Object[]{wdxxId,getCustomer(request).get("id"),content});
        if (result==1){
            return renderData(true,"提交成功",null);
        }else{
            return renderData(false,"提交失败",null);
        }
    }
    /*
     * @Author me7eorite
     * @Description 个人信息
     * @Date 17:19 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long, java.lang.String]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping("/mine")
    public String mine(Model model,HttpServletRequest request){
        Map map = getCustomer(request);
        if (map == null || map.size() ==0){
            return "/front/login";
        }
        model.addAttribute("customer",map);
        return "/front/mine";
    }
    /*
     * @Author me7eorite
     * @Description 修改个人信息
     * @Date 17:22 2020/1/30
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping("/registerModifySave")
    public ResponseEntity<String> registerModifySave(Model model,HttpServletRequest request,Long id){
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String phone = request.getParameter("phone");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String address = request.getParameter("address");
            String idcard = request.getParameter("idcard");
            String headPic = request.getParameter("headPic");
            String mb1 = request.getParameter("mb1");
            String mb2 = request.getParameter("mb2");
            String mb3 = request.getParameter("mb3");
            String yzm = request.getParameter("yzm");


            //判断验证码是否正确
            if(!yzm.toUpperCase().equals(request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY).toString().toUpperCase())){
                return renderData(false,"1",null);
            }

            //获取当前用户
            Map map = getCustomer(request);

            if (!map.get("password").equals(oldPassword)){
                return renderData(false,"2",null);
            }

            String sql = "update t_custom set name=?,password=?,phone=?,sex=?,age=?,address=?,idcard=?,headPic=?,mb1=?,mb2=?,mb3=? where id=?";
            int result = db.update(sql,new Object[]{name,newPassword,phone,sex,age,address,idcard,headPic,mb1,mb2,mb3,id});

            String sql2 = "select * from t_custom where id=?";
            Map<String,Object> map2 = db.queryForMap(sql2,new Object[]{id});

            return renderData(true,"修改成功",null);
    }
    /*
     * @Author me7eorite
     * @Description //注销
     * @Date 17:34 2020/1/30
     * @Param [javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return java.lang.String
     **/
    @RequestMapping("/out")
    public String out(HttpServletRequest request,Long id) {
        request.getSession().removeAttribute(Consts.CUSTOMER_BEAN);
        return "redirect:/front/login.html";
    }


    /*
     * @Author me7eorite
     * @Description 返回找回密码页面
     * @Date 17:38 2020/1/30
     * @Param [javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return java.lang.String
     **/
    @RequestMapping("/find")
    public String find(HttpServletRequest request,Long id) {

        return "/front/find";
    }
    /*
     * @Author me7eorite
     * @Description 判断密保是否正确
     * @Date 19:07 2020/1/31
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping("/findSave")
    public ResponseEntity<String> findSave(Model model,HttpServletRequest request){
        String username = request.getParameter("username");
        String mb1 = request.getParameter("mb1");
        String mb2 = request.getParameter("mb2");
        String mb3 = request.getParameter("mb3");
        String sql = "select * from t_custom where username=? and mb1=? and mb2=? and mb3=?";
        List list = db.queryForList(sql,new Object[]{username,mb1,mb2,mb3});
        if(list!=null && list.size() ==1){
            return  renderData(true,"成功",null);
        }else{
            return renderData(false,"失败",null);
        }
    }

    @RequestMapping("/findSaveConfirm")
    public ResponseEntity<String> findSaveConfirm(Model model,HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String sql = "update t_custom set password=? where username=?";
        int result =  db.update(sql,new Object[]{password,username});
        if(result ==1){
            return  renderData(true,"成功",null);
        }else{
            return renderData(false,"失败",null);
        }
    }


    }
