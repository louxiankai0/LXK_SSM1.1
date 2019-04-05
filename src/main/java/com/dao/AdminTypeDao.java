package com.dao;

import com.po.Goods;
import com.po.GoodsType;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("adminTypeDao")
@Mapper
public interface AdminTypeDao {
    List<GoodsType> selectGoodsType();

    List<GoodsType> selectAllGoodsTypeByPage(Map<String, Object> map);

    int addType(GoodsType goodstype);

    GoodsType selectGoodsTypeById(Integer id);

    int deleteAType(Integer id);

    int deleteType(List<Integer> ids);

    List<Goods> selectGoodsByType(Integer id);

    int updateGoodsTypeById(GoodsType goodsType);

    List<Map<String, Object>> selectGoods(Integer id);
}
