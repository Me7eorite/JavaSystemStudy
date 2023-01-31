package com.me7eorite.bbs.controller.admin;

import com.me7eorite.bbs.controller.BaseController;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName: WdxxController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2020/1/31 19:13
 * @Version: V1.0
 */
@Controller("wdxxController")
@RequestMapping(value = "/admin/wdxx")
public class WdxxController extends BaseController {
    /*
     * @Author me7eorite
     * @Description 返回所有帖子页面
     * @Date 19:24 2020/1/31
     * @Param [org.springframework.ui.Model]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/frame")
    public String frame(Model model){
        return "/admin/wdxx/frame";
    }

    /*
     * @Author me7eorite
     * @Description 列出所有的帖子
     * @Date 19:28 2020/1/31
     * @Param
     * @return
     **/

    @RequestMapping(value = "/list")
    public String list(Model model, HttpServletRequest request, String title){
        String sql = "select a.* from t_wdxx a where 1=1";
        if (title!=null && !title.equals("")){
            sql+=" and title like '%"+title+"%'";
        }
        sql+=" order by id desc";
        List list = db.queryForList(sql);
        request.setAttribute("list",list);
        return "/admin/wdxx/list";
    }

    /*
     * @Author me7eorite
     * @Description 管理页面删除指定帖子
     * @Date 19:31 2020/1/31
     * @Param [org.springframework.ui.Model, javax.servlet.http.HttpServletRequest, java.lang.Long]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    @RequestMapping(value = "/editDelete")
    public ResponseEntity<String> editDelete(Model model, HttpServletRequest request, Long id){
        int result = 0;
        String sql = "delete from t_wdxx where id=?";
        result = db.update(sql,new Object[]{id});
        if(result == 1){
            return renderData(true,"删除成功",null);
        }else {
            return renderData(false,"删除失败",null);
        }
    }

}
