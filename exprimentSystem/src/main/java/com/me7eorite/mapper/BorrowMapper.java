package com.me7eorite.mapper;

import com.me7eorite.entity.Borrow;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/30 18:59
 * @Description mapper类
 */
@Mapper
public interface BorrowMapper {
    List<Borrow> queryAllBorrow(String status);
    int insert(Borrow borrow);
    int update(Borrow borrow);
}
