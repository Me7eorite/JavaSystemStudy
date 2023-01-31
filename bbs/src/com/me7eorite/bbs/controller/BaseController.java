package com.me7eorite.bbs.controller;

import com.me7eorite.bbs.util.Consts;
import com.me7eorite.bbs.util.DBHelper;
import com.me7eorite.bbs.util.JacksonJsonUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;


public class BaseController {
    @Autowired
    public DBHelper db;

    public Map getCustomer(HttpServletRequest request){
        Map map = (Map)request.getSession().getAttribute(Consts.CUSTOMER_BEAN);
        return map;
    }

    /*
     * @Author me7eorite
     * @Description 定义请求的返回类型和编码
     * @Date 16:20 2020/1/25
     * @Param []
     * @return org.springframework.http.HttpHeaders
     **/
    public HttpHeaders initHttpHeader(){
        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = new MediaType("text","html", StandardCharsets.UTF_8);
        headers.setContentType(mediaType);
        return headers;
    }
    /*
     * @Author me7eorite
     * @Description 定义返回请求的实体
     * @Date 16:18 2020/1/25
     * @Param [java.lang.Boolean, java.lang.String, java.lang.Object]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    public ResponseEntity<String> renderData(Boolean status, String msg, Object obj){
        if(StringUtils.isEmpty(msg)){
            msg = "";
        }
        StringBuffer sb = new StringBuffer();
        sb.append("{");
        sb.append("\"status\":\""+status+"\",\"msg\":\""+msg+"\",");
        sb.append("\"data\":\""+ JacksonJsonUtil.toJson(obj)+"\"");
        sb.append("}");
        return new ResponseEntity<>(sb.toString(),initHttpHeader(), HttpStatus.OK);
    }
    /*
     * @Author me7eorite
     * @Description 返回包请求
     * @Date 20:54 2023/1/28
     * @Param [java.lang.Boolean, java.lang.String]
     * @return org.springframework.http.ResponseEntity<java.lang.String>
     **/
    public ResponseEntity<String> renderMsg(Boolean status, String msg){
        if(StringUtils.isEmpty(msg)){
            msg = "";
        }
        StringBuffer sb = new StringBuffer();
        sb.append("{");
        sb.append("\"status\":\""+status+"\",\"msg\":\""+msg+"\",");
        sb.append("}");
        return new ResponseEntity<>(sb.toString(),initHttpHeader(), HttpStatus.OK);
    }

    public void bkList(HttpServletRequest request){
        String sql = "select * from t_bk order by id desc";
        List<Map> list = db.queryForList(sql);
        request.setAttribute("rightBkList",list);
    }
}
