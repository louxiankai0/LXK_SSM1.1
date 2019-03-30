package com.controller.before;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.po.Order;
import com.service.before.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseBeforeController {
	@Autowired
	private OrderService orderService;
	/**
	 * 提交订单
	 */
	@RequestMapping("/orderSubmit")
	public String orderSubmit(Model model, HttpSession session,Double amount) {
		return orderService.orderSubmit(model, session, amount);
	}

	/**
	 * 支付订单
	 */
	@RequestMapping("/pay")
	public String pay(Integer ordersn) {
		return orderService.pay(ordersn);
	}

	/**
	 * 提交归还订单
	 * @param model
	 * @param oid
	 * @return
	 */
	@RequestMapping("/returnSubmit")
	public String returnSubmit(Model model,Integer oid,Integer gid,Integer shoppingnum){
		return orderService.returnSubmit(model,oid,gid,shoppingnum);
	}

	/**
	 * 归还订单
	 */
	@RequestMapping("/returnGoods")
	public String returnGoods(Integer returnsn){
		//return orderService.returnGoods(returnsn);
		return null;
	}

}
