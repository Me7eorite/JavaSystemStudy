package com.me7eorite.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @Author Me7eorite
 * @Date 2021/12/25 16:28
 * @Description table实体类
 */
@Data
@AllArgsConstructor
public class Table {
    private int  code;
    private String msg;
    private int count;
    private Object data;


}
