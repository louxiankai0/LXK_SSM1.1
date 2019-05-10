package com.controller.admin;

import com.po.GoodsType;
import com.service.admin.AdminTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/adminType")
public class AdminTypeController extends BaseController {
	@Autowired
	private AdminTypeService adminTypeService;

	/**
	 * 到查询页面
	 * @param model
	 * @param pageCur
	 * @param act
	 * @return
	 */
	@RequestMapping("/selectType")
	public String selectType(Model model, Integer pageCur, String act) {
		return adminTypeService.selectType(model, pageCur, act);
	}
	/**
	 * 查询一个物品
	 */
	@RequestMapping("/selectAType")
	public String selectAType(Model model, Integer id, String act){
		return adminTypeService.selectAType(model, id, act);
	}
	/**
	 * add页面初始化
	 */
	@RequestMapping("/toAddType")
	public String toAddType(Model model){
		model.addAttribute("goodstype", new GoodsType());
		return "admin/addType";
	}
	/**
	 * 添加与修改
	 */
	@RequestMapping("/addType")
	public String addType(@ModelAttribute GoodsType goodstype, HttpServletRequest request, String updateAct){
		return adminTypeService.addOrUpdateType(goodstype, request, updateAct);
	}
	/**
	 * 删除多个物品
	 */
	@RequestMapping("/deleteType")
	public String deleteType(Integer ids[], Model model) {
		return adminTypeService.deleteType(ids, model);
	}
	/**
	 * 删除一个物品
	 */
	@RequestMapping("/deleteAType")
	public String deleteAType(Integer id, Model model) {
		return adminTypeService.deleteAType(id, model);
	}
	
}
