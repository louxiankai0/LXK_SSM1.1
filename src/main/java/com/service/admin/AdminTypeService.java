package com.service.admin;

import com.po.GoodsType;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface AdminTypeService {
	 String selectAType(Model model, Integer id, String act);
	 String deleteType(Integer ids[], Model model);
	 String deleteAType(Integer id, Model model);
	 String addOrUpdateType(GoodsType goods, HttpServletRequest request, String updateAct);
	 String selectType(Model model, Integer pageCur, String act);
}
