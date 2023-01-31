package com.me7eorite.service.impl;

import com.me7eorite.entity.User;
import com.me7eorite.mapper.UserMapper;
import com.me7eorite.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author Me7eorite
 * @Date 2021/12/24 23:40
 * @Description 实现类
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User queryUserById(String stuid) {
        return this.userMapper.queryUserById(stuid);
    }
    public  User queryUserByName(String username){
        return this.userMapper.queryUserByName(username);
    }
}
