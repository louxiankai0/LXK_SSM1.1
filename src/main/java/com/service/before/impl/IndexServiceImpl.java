package com.service.before.impl;

import com.dao.AdminNoticeDao;
import com.dao.AdminTypeDao;
import com.dao.IndexDao;
import com.po.Buser;
import com.po.Goods;
import com.po.Notice;
import com.service.before.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexDao indexDao;
	@Autowired
	private AdminTypeDao adminTypeDao;
	@Autowired
	private AdminNoticeDao adminNoticeDao;
	@Override
	public String before(Model model, HttpSession session, Goods goods) {
		//将物品类别保存在session中，可以一直在头部显示物品类别
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		//租借排行
		model.addAttribute("salelist", indexDao.getSaleOrder());
		//关注排行
		model.addAttribute("focuslist", indexDao.getFocusOrder());
		//公告
		model.addAttribute("noticelist", indexDao.selectNotice());
		if(goods.getId() == null) {
			goods.setId(0);
		}
		//最新物品
		model.addAttribute("lastedlist", indexDao.getLastedGoods(goods));
		return "before/index";
	}

	@Override
	public String toRegister(Model model) {
		model.addAttribute("rbuser", new Buser());
		return "before/register";
	}

	@Override
	public String toLogin(Model model) {
		model.addAttribute("lbuser", new Buser());
		return "before/login";
	}

	@Override
	public String goodsDetail(Model model, Integer id) {
		Goods goods = indexDao.selectGoodsById(id);
		model.addAttribute("goods", goods);
		return "before/goodsdetail";
	}

	@Override
	public String selectANotice(Model model, Integer id) {
		Notice notice = adminNoticeDao.selectANotice(id);
		model.addAttribute("notice", notice);
		return "admin/noticeDetail";
	}

	@Override
	public String search(Model model, String mykey) {
		//用list保存根据前台传递过来的mykey所查询出的物品信息
		List<Goods> list = indexDao.search(mykey);
		//返回给前端
		model.addAttribute("searchlist", list);
		return "before/searchResult";
	}

	@Override
	public String moreDetail(Model model,Goods goods) {
		if(goods.getId() == null) {
			goods.setId(0);
		}
		model.addAttribute("lastedlist", indexDao.getGoods(goods));

		return "before/moreDetail";
	}

}
