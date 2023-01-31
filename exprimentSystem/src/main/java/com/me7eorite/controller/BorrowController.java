package com.me7eorite.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.me7eorite.entity.Borrow;
import com.me7eorite.entity.Device;
import com.me7eorite.entity.Table;
import com.me7eorite.service.impl.BorrowServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.Response;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author Me7eorite
 * @Date 2021/12/30 19:43
 * @Description
 */
@RestController
@RequestMapping("borrow")
public class BorrowController {
    @Autowired
    private BorrowServiceImpl borrowService;
    /***
     * @Author me7eorite
     * @Desc  显示使用情况
     * @Param []
     * @return org.springframework.http.ResponseEntity<java.lang.Object>
     * @Date 2021/12/30 21:32
     */
    @RequestMapping("useCase")
    public ResponseEntity<Object> allUseCase(int limit,int page,String status){
        List<Object> allTable = new ArrayList<>();
        // String status = "使用中";
        // System.out.println(limit+" "+page);
        List<Borrow> borrows = this.borrowService.queryAllBorrow(status);
        for (Borrow borrow : borrows) {
            Map b= JSON.parseObject(JSON.toJSONString(borrow), Map.class);
            // Device device = (Device) b.get("device");
            // System.out.println(b.get("device"));
            JSONObject jsonObject = (JSONObject) b.get("device");
            b.remove("device");
            b.put("name",jsonObject.get("name"));
            b.put("type",jsonObject.get("tid"));
            allTable.add(b);
        }
        Table tableData = new Table(0,"",borrows.size(),allTable);
        return new ResponseEntity<>(tableData, HttpStatus.OK);
    }

    @RequestMapping("new")
    public ResponseEntity<Object> newBorrow(@RequestBody Borrow borrow){
        // System.out.println(borrow);
        borrow.setCreateTime(new Date());
        borrow.setStatus("申请");
        if(this.borrowService.insert(borrow) == 1){
            return new ResponseEntity<>("添加成功",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("添加失败",HttpStatus.BAD_REQUEST);
        }
    }
    @RequestMapping("approve")
    public ResponseEntity<Object> approve(@RequestBody Borrow borrow){
        borrow.setStatus("同意");
        if(this.borrowService.update(borrow)==1) {
            return new ResponseEntity<>("同意使用", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("请求失败!",HttpStatus.OK);
        }

    }
    @RequestMapping("disapprove")
    public ResponseEntity<Object> disapprove(@RequestBody Borrow borrow){
        borrow.setStatus("驳回");
        if(this.borrowService.update(borrow)==1) {
            return new ResponseEntity<>("驳回成功!", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("请求失败!",HttpStatus.OK);
        }

    }


}

