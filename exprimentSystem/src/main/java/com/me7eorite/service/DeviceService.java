package com.me7eorite.service;

import com.me7eorite.entity.Borrow;
import com.me7eorite.entity.Device;

import java.util.List;

public interface DeviceService {
    List<Device> queryAllList();
    Device queryByTid(String tid);
    int addDevice(Device device);
    List<Device> queryByStatus(String status);
    int update(Device device);
    List<Device> queryAllBroke();
    List<Device> queryAllFix();
}

