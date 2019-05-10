package com.controller.before;

import com.po.Buser;
import com.service.before.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/register")
	//@ModelAttribute自动将前台传递的参数注入到buser中
	public String register(@ModelAttribute Buser buser, Model model, HttpSession session, String code) {
		return userService.register(buser, model, session, code);
	}
	@RequestMapping("/login")
	public String login(@ModelAttribute Buser buser, Model model, HttpSession session, String code) {
		return userService.login(buser, model, session, code);
	}
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.invalidate();
		return "forward:/before";
	}
}
