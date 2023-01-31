package com.me7eorite.service.impl;

import com.me7eorite.entity.Device;
import com.me7eorite.mapper.DeviceMapper;
import com.me7eorite.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author Me7eorite
 * @Date 2021/12/25 15:31
 * @Description 设备信息实现接口
 */
@Service
public class DeviceServiceImpl implements DeviceService {
    @Autowired
    private DeviceMapper deviceMapper;
    @Override
    public List<Device> queryAllList() {
        return this.deviceMapper.queryAllList();
    }

    @Override
    public List<Device> queryByStatus(String status) {
        return this.deviceMapper.queryByStatus(status);
    }

    @Override
    public int addDevice(Device device){
        this.deviceMapper.addDevice(device);
        return 1;
    }

    @Override
    public int update(Device device) {
       return this.deviceMapper.update(device);
    }

    @Override
    public Device queryByTid(String tid){
        return this.deviceMapper.queryByTid(tid);
    }

    @Override
    public List<Device> queryAllBroke(){
        return this.deviceMapper.queryAllBroke();
    }
    @Override
    public List<Device> queryAllFix(){
        return this.deviceMapper.queryAllFix();
    }

}
