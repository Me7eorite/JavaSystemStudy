package com.me7eorite.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @Author Me7eorite
 * @Date 2021/12/25 14:49
 * @Description 设备实体类
 */
@Data
@ToString
public class Device {
    private int id;//id
    private String tid;//编号
    private String type;//型号
    private String name;//设备名
    private String standard;//规格
    private double unitPrice;//单价
    private int totally;//购买数量
    private Date createTime;//购买日期
    private Date deadLine;//使用截止日期
    private String creator;//经办人
    private int freeDevice;//空闲的设备
    private String remarks;//备注
    private String status;//状态
}
