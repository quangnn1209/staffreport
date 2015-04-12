package com.seta.staffreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seta.staffreport.common.EmployeeHelper;
import com.seta.staffreport.common.ProductivityHelper;
import com.seta.staffreport.persisted.Employees;
import com.seta.staffreport.persisted.Productivity;

@Controller
public class ProductivityController extends BaseController {

	@RequestMapping(value = "getProductivityByEmpId", method = RequestMethod.GET)
	public ModelAndView getProductivityByEmpId(Integer id) {
		ModelAndView mav = new ModelAndView("productivities");
		Employees employee = new Employees(id);
		mav.addObject("emp", EmployeeHelper.getPersistantObject(employee));
		return mav;
	}

	@RequestMapping(value = "updateProductivity", method = RequestMethod.POST)
	public @ResponseBody
	String updateProductivity(@RequestBody Productivity productivity) {
		if (productivity.getId() != null) {
			productivity = ProductivityHelper.getPersistantObject(productivity);
		}

		// Save
		if (ProductivityHelper.saveOrUpdate(productivity) > 0) {
			return "Update employee succesful!";
		}
		return "Update employee failed!";
	}
}