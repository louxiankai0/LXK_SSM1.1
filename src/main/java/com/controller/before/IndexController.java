package com.controller.before;

import com.po.Goods;
import com.service.before.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	/**
	 * 首页
	 */
	@RequestMapping("/before")
	public String before(Model model,HttpSession session, Goods goods) {
		return indexService.before(model, session, goods);
	}
	/**
	 * 转到注册页面
	 */
	@RequestMapping("/toRegister")
	public String toRegister(Model model) {
		return indexService.toRegister(model);
	}

	/**
	 * 转到登录页面
	 */
	@RequestMapping("/toLogin")
	public String toLogin(Model model) {
		return indexService.toLogin(model);
	}

	/**
	 * 转到商品详情页
	 */
	@RequestMapping("/goodsDetail")
	public String goodsDetail(Model model,Integer id) {
		return indexService.goodsDetail(model, id);
	}

	/**
	 * 转到更多页面
	 */
	@RequestMapping("/moreDetail")
	public String moreDetail(Model model,Goods goods){
		return indexService.moreDetail(model,goods);
	}
	/**
	 * 转到公告页面
	 */
	@RequestMapping("/selectANotice")
	public String selectANotice(Model model,Integer id) {
		return indexService.selectANotice(model, id);
	}

	/**
	 * 首页搜索
	 */
	@RequestMapping("/search")
	public String search(Model model,String mykey) {
		return indexService.search(model, mykey);
	}
}
