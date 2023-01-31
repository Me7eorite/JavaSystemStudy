package com.me7eorite.service.impl;

import com.me7eorite.entity.Borrow;
import com.me7eorite.mapper.BorrowMapper;
import com.me7eorite.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/30 18:59
 * @Description 借用的实现接口
 */
@Service
public class BorrowServiceImpl implements BorrowService {
    @Autowired
    private BorrowMapper borrowMapper;
    @Override
    public List<Borrow> queryAllBorrow(String status) {
        return this.borrowMapper.queryAllBorrow(status);
    }

    @Override
    public int insert(Borrow borrow) {
      return  this.borrowMapper.insert(borrow);

    }

    @Override
    public int update(Borrow borrow) {
       return this.borrowMapper.update(borrow);
    }


}
