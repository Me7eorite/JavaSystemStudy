package com.me7eorite.service;

import com.me7eorite.entity.Borrow;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/30 18:57
 * @Description 借用的接口
 */
public interface BorrowService {
    List<Borrow> queryAllBorrow(String status);
    int insert(Borrow borrow);
    int update(Borrow borrow);
}
