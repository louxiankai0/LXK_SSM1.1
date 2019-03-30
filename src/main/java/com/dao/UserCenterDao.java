package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("userCenterDao")
@Mapper
public interface UserCenterDao {
	public List<Map<String, Object>> myOrder(Integer bid);
	public List<Map<String, Object>> myFocus(Integer bid);
	public List<Map<String, Object>> orderDetail(Integer ordersn);
}
