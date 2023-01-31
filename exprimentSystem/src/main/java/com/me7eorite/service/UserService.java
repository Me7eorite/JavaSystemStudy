package com.me7eorite.service;

import com.me7eorite.entity.User;

/**
 * @Author Me7eorite
 * @Date 2021/12/24 23:40
 * @Description
 */
public interface UserService {
    User queryUserById(String stuid);
    User queryUserByName(String username);
}
