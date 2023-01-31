package com.me7eorite.bbs.controller.admin;

import com.me7eorite.bbs.controller.BaseController;
import com.me7eorite.bbs.util.Consts;
import com.me7eorite.bbs.util.DBHelper;
import com.me7eorite.bbs.util.JacksonJsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @ClassName: AdminController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2020/1/25 16:12
 * @Version: V1.0
 */
public class AdminBaseController extends BaseController {

    public Map getAdmin(HttpServletRequest request){
        Map map = (Map) request.getSession().getAttribute(Consts.ADMIN_NAME);
        return map;
    }

}
