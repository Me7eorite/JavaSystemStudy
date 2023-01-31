package com.me7eorite.mapper;

import com.me7eorite.entity.Apply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/27 20:42
 * @Description 申请处理类
 */
@Mapper
public interface ApplyMapper {
    List<Apply> queryAllList();
    List<Apply> queryApplyByStatus(String status);
    int addApplyForm(Apply apply);
    int update(int id);
    int updateByObject(Apply apply);
}
