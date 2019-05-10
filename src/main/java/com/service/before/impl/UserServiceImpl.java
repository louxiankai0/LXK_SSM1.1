package com.service.before.impl;

import com.dao.UserDao;
import com.po.Buser;
import com.service.before.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public String register(Buser buser, Model model, HttpSession session, String code) {
		//将前台传递的验证码code进行比较，不考虑大小写
		if(!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("codeError", "验证码错误！");
			return "before/register";
		}
		//用int类型n接收插入数据条数
		int n = userDao.register(buser);
		if(n > 0) {
			model.addAttribute("msg","注册成功");
			return "before/login";
		}else {
			model.addAttribute("msg", "注册失败！");
			return "before/register";
		}
	}
	@Override
	public String login(Buser buser, Model model, HttpSession session, String code) {
		if(!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("msg", "验证码错误！");
			return "before/login";
		}
		//定义Buser类型的ruser为空
		Buser ruser = null;
		//用list接收通过传入的buser值查询出的数据
		List<Buser> list = userDao.login(buser);
		if(list.size() > 0) {
			//获取list中第一条数据
			ruser = list.get(0);
		}
		if(ruser != null) {
			//将ruser存入session
			session.setAttribute("bruser", ruser);
			return "forward:/before";
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return "before/login";
		}
	}

}
