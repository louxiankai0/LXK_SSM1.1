package com.service.admin;

import org.springframework.ui.Model;

public interface AdminOrderService {
	 String orderInfo(Model model);
	 String deleteorderManager(Integer id);

    String orderDetail(Model model, Integer ordersn);
}
