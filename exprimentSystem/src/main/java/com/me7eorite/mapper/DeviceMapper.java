package com.me7eorite.mapper;

import com.me7eorite.entity.Device;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/25 15:30
 * @Description 设备mapper接口
 */
@Mapper
public interface DeviceMapper {
    List<Device> queryAllList();
    Device queryByTid(String tid);
    List<Device> queryByStatus(String status);
    int update(Device device);
    int addDevice(Device device);
    List<Device> queryAllBroke();
    List<Device> queryAllFix();
}
