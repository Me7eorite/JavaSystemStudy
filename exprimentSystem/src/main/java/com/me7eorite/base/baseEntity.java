package com.me7eorite.base;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.apache.tomcat.jni.Time;

import java.time.LocalDate;
import java.util.Date;


/**
 * @Author Me7eorite
 * @Date 2021/12/22 22:59
 * @Description
 */

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class baseEntity {
    private String creator;

    private LocalDate createTime= LocalDate.now();
}
