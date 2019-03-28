package com.service.admin;

import com.po.GoodsType;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface AdminTypeService {
	public String selectAType(Model model, Integer id, String act);
	public String deleteType(Integer ids[], Model model);
	public String deleteAType(Integer id, Model model);
	public String addOrUpdateType(GoodsType goods, HttpServletRequest request, String updateAct);
	public String selectType(Model model, Integer pageCur, String act);
}
