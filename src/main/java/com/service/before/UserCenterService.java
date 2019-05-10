package com.service.before;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface UserCenterService {
	 String userCenter(HttpSession session, Model model);
	 String orderDetail(Model model, Integer ordersn);
}
