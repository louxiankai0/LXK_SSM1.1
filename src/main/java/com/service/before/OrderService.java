package com.service.before;

import com.po.Order;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface OrderService {
	 String orderSubmit(Model model, HttpSession session, Double amount);
	 String pay(Integer ordersn);

	String returnSubmit(Model model, Integer oid, Integer gid, Integer shoppingnum);
}
