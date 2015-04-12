package com.seta.staffreport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seta.staffreport.common.AdminHelper;
import com.seta.staffreport.common.Constant;
import com.seta.staffreport.persisted.Admin;

@Controller
public class AdminController extends BaseController {
	@RequestMapping(value = "doLogin", method = RequestMethod.POST)
	public String doLogin(Admin admin, HttpServletRequest request) {
		admin = AdminHelper.doLogin(admin);
		if (admin != null) {
			request.getSession().setAttribute(Constant.ADMIN_SESSION, admin);
			return "redirect:home";
		}
		return "index";
	}

	@RequestMapping(value = "doLogout", method = RequestMethod.GET)
	public String doLogout(HttpServletRequest request) {
		request.getSession().removeAttribute(Constant.ADMIN_SESSION);
		return "index";
	}
}
