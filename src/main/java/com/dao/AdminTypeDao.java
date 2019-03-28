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
	public List<GoodsType> selectGoodsType();
	public List<GoodsType> selectAllGoodsTypeByPage(Map<String, Object> map);
	public int addType(GoodsType goodstype);
	public GoodsType selectGoodsTypeById(Integer id);
	public int deleteAType(Integer id);
	public int deleteType(List<Integer> ids);
	public List<Goods> selectGoodsByType(Integer id);
	public int updateGoodsTypeById(GoodsType goodsType);
	public List<Map<String, Object>> selectGoods(Integer id);
}
