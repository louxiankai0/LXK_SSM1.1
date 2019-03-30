package com.service.before;

import com.po.Buser;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface UserService {
	public String register(Buser buser, Model model, HttpSession session, String code);
	public String login(Buser buser, Model model, HttpSession session, String code);
}
