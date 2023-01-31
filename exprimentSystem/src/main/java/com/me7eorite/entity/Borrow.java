package com.me7eorite.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/30 14:37
 * @Description 借用类
 */
@Data
@ToString
public class Borrow {
    private int id;
    private int tid;//关联的设备id
    private int quantity;//借用数量
    private Date createTime;//借用时间
    private Date endTime;//预期归还时间
    private String status;//当前状态
    private String creator;//借用人
    private Device device;//借用设备
    private String remarks;//备注
}
