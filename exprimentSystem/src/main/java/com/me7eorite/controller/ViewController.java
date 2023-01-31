package com.me7eorite.controller;

import com.me7eorite.entity.Device;
import com.me7eorite.entity.User;
import com.me7eorite.service.impl.DeviceServiceImpl;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/30 14:33
 * @Description 视图的调用界面
 */

@Controller
@RequestMapping("view")
public class ViewController {
    @Autowired
    private DeviceServiceImpl deviceService;
    @RequestMapping("useCase")
    public String useCase(){
        return "page/useCase.html";
    }
    @RequestMapping("useApply")
    public String useApply(Model model,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("uname",user.getRname());
        return "page/apply.html";
    }
    @RequestMapping("allUseApply")
    public String allUseApply(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user.getIdentity().equals("student")){
            return "redirect:/user/welcome";
        }else{
            return "page/allUseApply.html";
        }

    }
    @RequestMapping("buyApply")
    public String buyApply(Model model,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("uname",user.getUname());
        return "page/buyApply.html";
    }
    @RequestMapping("deviceManage")
    public String deviceManage(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user.getIdentity().equals("student")){
            return "redirect:/user/welcome";
        }else{
            return "page/deviceManage.html";
        }

    }
    @RequestMapping("allBuyApply")
    public String allBuyApply(){
        return "page/allBuyApply.html";
    }
    @RequestMapping("totallyBill")
    public String totally(Model model){
        int totallyNum = 0;
        double totallyPrice = 0.0;
        List<Device> devices = this.deviceService.queryAllList();
        int otherNum = devices.size();
        for (Device device : devices) {
            totallyNum+=device.getTotally();
            totallyPrice+=totallyNum*device.getUnitPrice();
        }
        model.addAttribute("otherNum",otherNum);
        model.addAttribute("totallyNum",totallyNum);
        model.addAttribute("tatallyPrice",totallyPrice);
        return "page/totallyBill.html";
    }
    @RequestMapping("fixBill")
    public String totally(){
        return "page/fixBill.html";
    }
    @RequestMapping("brokenBill")
    public String brokenBill(Model model){
        int totallyNum = 0;
        double totallyPrice = 0.0;
        List<Device> devices = this.deviceService.queryAllBroke();
        int otherNum = devices.size();
        for (Device device : devices) {
            totallyNum+=device.getTotally();
            totallyPrice+=totallyNum*device.getUnitPrice();
        }
        model.addAttribute("otherNum",otherNum);
        model.addAttribute("totallyNum",totallyNum);
        model.addAttribute("tatallyPrice",totallyPrice);
        return "page/brokenBill.html";
    }
    @RequestMapping("add")
    public String addDevice(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user.getIdentity().equals("student")){
            return "redirect:/user/welcome";
        }else{
            return "page/form.html";
        }
    }
}
