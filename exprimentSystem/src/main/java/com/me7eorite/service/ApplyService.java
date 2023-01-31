package com.me7eorite.service;

import com.me7eorite.entity.Apply;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/27 20:44
 * @Description 申请服务接口
 */
public interface ApplyService {
    List<Apply> queryAllList();
    int addApplyForm(Apply apply);
    List<Apply> queryApplyByStatus(String status);
    int update(int id);
    int updateByObject(Apply apply);
}
