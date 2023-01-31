package com.me7eorite.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/27 20:23
 * @Description 申请实体
 */
@Data
@ToString
public class Apply {
    private int id;//编号
    private String tid;//关联编号
    private String name;//申请人
    private int quantity; //数量
    private String status;// 状态 （申请1 --》 批准2 --》采购3 --》采购完成4）  申请1--》驳回0
    private List<Device> devices; //设备 已有/没有（新建）
    private Date createTime;//创建时间
    private String remarks;//用途说明
}
