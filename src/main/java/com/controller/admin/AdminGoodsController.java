package com.controller.admin;

import com.po.Goods;
import com.service.admin.AdminGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController extends BaseController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	@RequestMapping("/selectGoods")
	public String selectGoods(Model model, Integer pageCur, String act) {
		return adminGoodsService.selectGoods(model, pageCur, act);
	}
	/**
	 * 查询一个物品
	 */
	@RequestMapping("/selectAGoods")
	public String selectAGoods(Model model, Integer id, String act){
		return adminGoodsService.selectAGoods(model, id, act);
	}
	/**
	 * add页面初始化
	 */
	@RequestMapping("/toAddGoods")
	public String toAddGoods(Model model){
		model.addAttribute("goods", new Goods());
		return "admin/addGoods";
	}
	/**
	 * 添加与修改
	 */
	@RequestMapping("/addGoods")
	public String addGoods(@ModelAttribute Goods goods, HttpServletRequest request, String updateAct){
		return adminGoodsService.addOrUpdateGoods(goods, request, updateAct);
	}
	/**
	 * 删除多个物品
	 */
	@RequestMapping("/deleteGoods")
	public String deleteGoods(Integer ids[], Model model) {
		return adminGoodsService.deleteGoods(ids, model);
	}

}
