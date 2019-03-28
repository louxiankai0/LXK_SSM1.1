package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("adminOrderDao")
@Mapper
public interface AdminOrderDao {
	public List<Map<String,Object>> orderInfo();
	public List<Map<String,Object>> orderInfoByPage(Map<String, Object> map);
	public int deleteOrderDetail(Integer id);
	public int deleteOrderBase(Integer id);
}
