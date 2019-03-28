package com.controller.before;

import com.exception.UserLoginNoException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BaseBeforeController {
	/**
	 * 前台用户登录权限控制，处理方法执行前执行该方法
	 * @throws UserLoginNoException
	 */
	@ModelAttribute  
    public void isLogin(HttpSession session, HttpServletRequest request) throws UserLoginNoException {
       if(session.getAttribute("bruser") == null){  
            throw new UserLoginNoException("没有登录");
       }  
    } 
}
