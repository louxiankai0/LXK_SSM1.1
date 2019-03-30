package com.controller.before;

import com.service.before.UserCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserCenterController extends BaseBeforeController {
	@Autowired
	private UserCenterService userCenterService;
	@RequestMapping("/userCenter")
	public String userCenter(HttpSession session, Model model) {
		return userCenterService.userCenter(session, model);
	}
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model, Integer ordersn) {
		return userCenterService.orderDetail(model, ordersn);
	}
}
