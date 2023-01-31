package com.me7eorite.bbs.intercepter;

import com.me7eorite.bbs.util.Consts;
import oracle.jdbc.driver.Const;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class ProtalSessionHandlerInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String url = getRequestUrl(request);
        System.out.println("url: "+url);
        if (url.startsWith("/adminLogin/")){
            return true;
        }
//        return true;
        if (url.startsWith("/admin/")){
            Map map  = (Map)request.getSession().getAttribute(Consts.ADMIN_NAME);
            if(map == null || map.size()==0){
                response.sendRedirect(request.getContextPath()+"/adminLogin/login.html");
                return false;
            }
            return true;
        }
        return true;
    }
    public String getRequestUrl(HttpServletRequest request){
        String url = request.getRequestURI();
        String path = request.getContextPath();
        if(StringUtils.isNotEmpty(path)){
            return url.substring(path.length());
        }
        return url;
    }
}
