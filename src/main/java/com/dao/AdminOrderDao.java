package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("adminOrderDao")
@Mapper
public interface AdminOrderDao {
    List<Map<String, Object>> orderInfo();

    List<Map<String, Object>> orderInfoByPage(Map<String, Object> map);

    int deleteOrderDetail(Integer id);

    int deleteOrderBase(Integer id);

    List<Map<String, Object>> orderDetail(@Param("ordersn") Integer ordersn);
}
