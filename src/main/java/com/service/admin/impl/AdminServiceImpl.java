package com.service.admin.impl;

import com.dao.AdminDao;
import com.dao.AdminTypeDao;
import com.po.Auser;
import com.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private AdminTypeDao adminTypeDao;
	@Override
	public String login(Auser auser, Model model, HttpSession session) {
		if(adminDao.login(auser) != null && adminDao.login(auser).size() > 0) {
			//将auser保存到session中
			session.setAttribute("auser", auser);
			//添加物品与修改物品页面使用
			session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
			return "admin/main";
		}
		model.addAttribute("msg", "用户名或密码错误");
		return "admin/login";
	}

}
