package com.service.before.impl;

import com.dao.CartDao;
import com.service.before.CartService;
import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;
	@Override
	public String focus(Model model, Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//向map添加session中用户ID和传递过来的物品ID
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", id);
		//用list接收该用户ID是否已关注该物品
		List<Map<String, Object>> list = cartDao.isFocus(map);
		if(list.size() > 0) {
			model.addAttribute("msg", "已关注该物品！");
		}else {
			//用n接收插入的信息条
			int n = cartDao.focus(map);
			if(n > 0){
				model.addAttribute("msg", "成功关注该物品！");
			}
			else{
				model.addAttribute("msg", "关注失败！");
			}
		}
		return "forward:/goodsDetail?id=" + id;
	}
	@Override
	public String putCart(Model model, Integer shoppingnum, Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//向map添加session中用户ID，物品ID和租借数量
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", id);
		map.put("shoppingnum", shoppingnum);
		//是否已添加购物车
		List<Map<String, Object>> list = cartDao.isPutCart(map);
		//如果购物车有该条数据则原租借数量加上添加的租借数量
		if(list.size() > 0){
			cartDao.updateCart(map);
		}
		else{
			cartDao.putCart(map);
		}
		return "forward:/cart/selectCart";
	}
	@Override
	public String selectCart(Model model, HttpSession session) {
		//用list接收传入用户ID查询出的购物车数据
		List<Map<String, Object>> list = cartDao.selectCart(MyUtil.getUserId(session));
		//定义double类型的总计
		double sum = 0;
		//遍历list获得一条一条购物车数据，一条一条smallsum小计（xml中计算好）总和为sum总价
		for (Map<String, Object> map : list) {
			//向map添加小计
			sum = sum + (Double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartlist", list);
		return "before/cart";
	}
	@Override
	public String deleteAgoods(Integer id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", id);
		cartDao.deleteAgoods(map);
		return "forward:/cart/selectCart";
	}
	@Override
	public String clear(HttpSession session) {
		cartDao.clear(MyUtil.getUserId(session));
		return "forward:/cart/selectCart";
	}
	@Override
	public String orderConfirm(Model model, HttpSession session) {
		List<Map<String, Object>> list = cartDao.selectCart(MyUtil.getUserId(session));
		double sum = 0;
		for (Map<String, Object> map : list) {
			sum = sum + (Double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartlist", list);
		return "before/orderconfirm";
	}

}
