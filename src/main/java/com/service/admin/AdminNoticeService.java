package com.service.admin;

import com.po.Notice;
import org.springframework.ui.Model;

public interface AdminNoticeService {
	 String addNotice(Notice notice);
	 String deleteNoticeSelect(Model model);
	 String selectANotice(Model model, Integer id);
	 String deleteNotice(Integer id);
}
