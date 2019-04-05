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
    int addOrder(Order order);

    int addOrderDetail(Map<String, Object> map);

    List<Map<String, Object>> selectGoodsShop(Integer uid);

    int updateStore(Map<String, Object> map);

    int clear(Integer uid);

    int pay(Integer ordersn);


    int addReturnOrder(@Param("oid") Integer oid, @Param("gid") Integer gid,
                       @Param("shoppingnum") Integer shoppingnum);

    List<Map<String, Object>> selectGoodsShopByoid(Integer oid);

    int updateStoreR(Map<String, Object> map);

    int returnGoods(Integer oid);
}
