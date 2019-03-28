package com.service.admin;

import com.po.Notice;
import org.springframework.ui.Model;

public interface AdminNoticeService {
	public String addNotice(Notice notice);
	public String deleteNoticeSelect(Model model);
	public String selectANotice(Model model, Integer id);
	public String deleteNotice(Integer id);
}
