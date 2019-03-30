package com.service.admin.impl;

import com.dao.AdminNoticeDao;
import com.po.Notice;
import com.service.admin.AdminNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service("adminNoticeService")
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	private AdminNoticeDao adminNoticeDao;
	@Override
	public String addNotice(Notice notice) {
		adminNoticeDao.addNotice(notice);
		return "forward:/adminNotice/deleteNoticeSelect";
	}
	@Override
	public String deleteNoticeSelect(Model model) {
		model.addAttribute("allNotices", adminNoticeDao.deleteNoticeSelect());
		return "admin/deleteNoticeSelect";
	}
	@Override
	public String selectANotice(Model model, Integer id) {
		model.addAttribute("notice", adminNoticeDao.selectANotice(id));
		return "admin/noticeDetail";
	}
	@Override
	public String deleteNotice(Integer id) {
		adminNoticeDao.deleteNotice(id);
		return "forward:/adminNotice/deleteNoticeSelect";
	}

}
