package com.seta.staffreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seta.staffreport.common.EmployeeHelper;

@Controller
public class EmployeesController {
	@RequestMapping(value = "getEmployees", method = RequestMethod.GET)
	public ModelAndView getEmployees() {
		ModelAndView mav = new ModelAndView("employees");
		mav.addObject("employees", EmployeeHelper.getAllEmployeess());
		return mav;
	}
}
