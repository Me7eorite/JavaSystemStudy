package com.me7eorite.entity;

import lombok.Data;

/**
 * @Author Me7eorite
 * @Date 2021/12/24 23:39
 * @Description 用户实体类
 */
@Data
public class User {
    private String id;
    private String sid;//学生学号
    private String uname;//系统登录名
    private String identity;//身份
    private String rname;//真实姓名
    private int gender;//性别
    private String pwd;//密码
    private String salt; //加盐
    private int status;//状态 冻结、可使用
}
