package com.service.before;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface UserCenterService {
	public String userCenter(HttpSession session, Model model);
	public String orderDetail(Model model, Integer ordersn);
}
