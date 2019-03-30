package com.service.before;

import com.po.Goods;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface IndexService {
	public String before(Model model, HttpSession session, Goods goods);
	public String toRegister(Model model);
	public String toLogin(Model model);
	public String goodsDetail(Model model, Integer id);
	public String selectANotice(Model model, Integer id);
	public String search(Model model, String mykey);
}
