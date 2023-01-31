package com.me7eorite.service.impl;

import com.me7eorite.entity.Apply;
import com.me7eorite.mapper.ApplyMapper;
import com.me7eorite.service.ApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/27 20:44
 * @Description 请求服务实现接口
 */
@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    private ApplyMapper applyMapper;

    public List<Apply> queryAllList(){
        return this.applyMapper.queryAllList();
    }
    public int addApplyForm(Apply apply){
        this.applyMapper.addApplyForm(apply);
        return 1;
    }
    @Override
    public int updateByObject(Apply apply){
        return this.applyMapper.updateByObject(apply);
    }
    @Override
    public int update(int id) {
        return this.applyMapper.update(id);
    }
    @Override
    public List<Apply> queryApplyByStatus(String status){
        return  this.applyMapper.queryApplyByStatus(status);
    }
}
