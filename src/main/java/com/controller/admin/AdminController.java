package com.controller.admin;

import com.po.Auser;
import com.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping("/admin")
	public String toLogin(@ModelAttribute Auser auser) {
		return "admin/login";
	}
	@RequestMapping("/admin/login")
	//ModelAttribute将客户端传递过来的参数按名称注入到指定对象中，并且会将这个对象自动加入ModelMap中，便于View层使用
	public String login(@ModelAttribute Auser auser, Model model, HttpSession session) {
		return adminService.login(auser, model, session);
	}
	@RequestMapping("/exit")
	public String exit(@ModelAttribute Auser auser, HttpSession session) {
		//销毁session
		session.invalidate();
		return "admin/login";
	}
}
