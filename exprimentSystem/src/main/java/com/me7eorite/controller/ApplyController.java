package com.me7eorite.controller;

import com.me7eorite.entity.Apply;
import com.me7eorite.entity.Table;
import com.me7eorite.service.impl.ApplyServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/28 10:25
 * @Description 购买控制
 */
@RestController
@RequestMapping("apply")
public class ApplyController {
    @Autowired
    private ApplyServiceImpl applyService;

    @RequestMapping("new")
    public ResponseEntity<Object> newApply(@RequestBody Apply apply){
        apply.setCreateTime(new Date());
        apply.setStatus("申请");
        if(this.applyService.addApplyForm(apply)==1) {
            return new ResponseEntity<>("创建成功", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("创建失败!",HttpStatus.BAD_REQUEST);
        }
     }
    @RequestMapping("delete")
    public ResponseEntity<Object> deleteApply(@Param("id") int id){
        if(this.applyService.update(id)==1){
            return new ResponseEntity<>("驳回成功!",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("修改失败",HttpStatus.BAD_REQUEST);
        }
    }
    @RequestMapping("approve")
    public ResponseEntity<Object> approve(@RequestBody Apply apply){
        apply.setStatus("采购中");
        if(this.applyService.updateByObject(apply)==1){
            return new ResponseEntity<>("同意使用",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("请求失败!",HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping("disapprove")
    public ResponseEntity<Object> disapprove(@RequestBody Apply apply){
        apply.setStatus("驳回");
        if(this.applyService.updateByObject(apply)==1){
            return new ResponseEntity<>("驳回成功",HttpStatus.OK);
        }else{
            return new ResponseEntity<>("请求失败!",HttpStatus.BAD_REQUEST);
        }
    }
}
