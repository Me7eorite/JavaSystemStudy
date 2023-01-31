package com.me7eorite.controller;

import com.me7eorite.entity.Apply;
import com.me7eorite.entity.Device;
import com.me7eorite.entity.Table;
import com.me7eorite.service.impl.ApplyServiceImpl;
import com.me7eorite.service.impl.DeviceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/25 15:58
 * @Description 设备控制器
 */
@RestController
@RequestMapping("device")
public class DeviceController {
    @Autowired
    private DeviceServiceImpl deviceService;

    @Autowired
    private ApplyServiceImpl applyService;

    /**
     * @Author me7eorite
     * @Desc  显示所有剩余可以操作的数量
     * @Param []
     * @return java.lang.Object
     * @Date 2021/12/25 19:53
     */
    @RequestMapping("all")
    public Object queryAllDevice(String status,int page,int limit){
        List<Device> deviceList = this.deviceService.queryByStatus(status);
        // System.out.println(status);
        return new Table(0,"",deviceList.size(),deviceList);
    }

    @RequestMapping("add")
    public ResponseEntity<Object> addDevice(@RequestBody Device device){
        List<Device> devices = this.deviceService.queryAllList();
        device.setCreateTime(new Date());
        device.setStatus("创建");
        device.setFreeDevice(0);
        device.setTotally(0);
        device.setTid(device.getType()+"-"+devices.size());
        if(this.deviceService.addDevice(device)==1){
            return new ResponseEntity<>("添加成功",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("添加失败",HttpStatus.OK);
        }
    }




    @RequestMapping("applyDevice")
    public void applyDevice(@RequestBody Device device){
        int size = this.deviceService.queryAllList().size();
        // System.out.println(device);
        device.setTid("device--"+size);
        device.setStatus("申请");
        device.setFreeDevice(0);
        device.setCreateTime(new Date());
        this.deviceService.addDevice(device);
    }

    @RequestMapping("allbroken")
    public  Object allBroken(@RequestBody Device device){
        List<Device> deviceList = this.deviceService.queryAllBroke();
        Table tableData = new Table(0,"",deviceList.size(),deviceList);
        return tableData;
    }

    @RequestMapping("allfix")
    public  Object allFix(){
        List<Device> deviceList = this.deviceService.queryAllFix();
        Table tableData = new Table(0,"",deviceList.size(),deviceList);
        return tableData;
    }

    @RequestMapping("broken")
    public ResponseEntity<Object> broken(@RequestBody Device device){
        device.setStatus("报废申请");
        if(this.deviceService.update(device)==1){
            return new ResponseEntity<>("修改成功",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("修改失败",HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping("fix")
    public ResponseEntity<Object> fix(@RequestBody Device device){
        device.setStatus("修理申请");
        if(this.deviceService.update(device)==1){
            return new ResponseEntity<>("修改成功",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("修改失败",HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping("query")
    public ResponseEntity<Object> queryByTid(@RequestParam("tid") String tid){
        Device device = this.deviceService.queryByTid(tid);
        if(device!=null){
             return new ResponseEntity<>(device, HttpStatus.OK);
        }else{
            return new ResponseEntity<>(device,HttpStatus.BAD_REQUEST);
        }
    }



}
