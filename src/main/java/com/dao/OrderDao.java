package com.dao;

import com.po.Order;
import com.po.Returnorder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("orderDao")
@Mapper
public interface OrderDao {
	public int addOrder(Order order);
	public int addOrderDetail(Map<String, Object> map);
	public List<Map<String, Object>> selectGoodsShop(Integer uid);
	public int updateStore(Map<String, Object> map);
	public int clear(Integer uid);
	public int pay(Integer ordersn);


	public int addReturnOrder(@Param("oid")Integer oid,@Param("gid")Integer gid,
							  @Param("shoppingnum")Integer shoppingnum);
	public List<Map<String, Object>> selectGoodsShopByoid(Integer oid);
	public int updateStoreR(Map<String, Object> map);
	int returnGoods(Integer oid);
}
