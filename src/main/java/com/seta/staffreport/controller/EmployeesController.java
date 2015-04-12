package com.seta.staffreport.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seta.staffreport.common.DivisionHelper;
import com.seta.staffreport.common.EmployeeHelper;
import com.seta.staffreport.common.TeamHelper;
import com.seta.staffreport.persisted.Employees;

@Controller
public class EmployeesController extends BaseController {
	@RequestMapping(value = "getEmployees", method = RequestMethod.POST)
	public ModelAndView getEmployees(@RequestBody Employees employee) {
		ModelAndView mav = new ModelAndView("employees");
		mav.addObject("employees", EmployeeHelper.searchEmployees(employee));
		return mav;
	}

	@RequestMapping(value = "goEmployeeMain", method = RequestMethod.GET)
	public String goEmployeeMain() {
		return "employeeMain";
	}

	@RequestMapping(value = "getEmployeeById", method = RequestMethod.GET)
	public ModelAndView getEmployeeById(Integer id) {
		ModelAndView mav = new ModelAndView("employee");
		Employees employee = new Employees(id);
		mav.addObject("emp", EmployeeHelper.getPersistantObject(employee));
		mav.addObject("divisions", DivisionHelper.getAllDivisions());
		mav.addObject("teams", TeamHelper.getAllTeams());
		return mav;
	}

	@RequestMapping(value = "updateEmployee", method = RequestMethod.POST)
	public @ResponseBody
	String updateEmployee(@RequestBody Employees employees) {
		// Validate data
		if (employees.getJoinDate() == null) {
			employees.setJoinDate(new Date());
		}
		if (employees.getEmpFullName() == null || employees.getEmpFullName().isEmpty()) {
			return "Please fill up all required fields!";
		}
		if (employees.getEmpId() != null) {
			Employees oldEmp = new Employees(employees.getEmpId());
			oldEmp = EmployeeHelper.getPersistantObject(oldEmp);
			employees.setImage(oldEmp.getImage());
		}
		// Save
		if (EmployeeHelper.saveOrUpdate(employees) > 0) {
			return "Update employee succesful!";
		}
		return "Update employee failed!";
	}

	@RequestMapping(value = "deleteEmployee", method = RequestMethod.POST)
	public @ResponseBody
	String deleteEmployee(Integer id) {
		Employees employee = new Employees(id);
		EmployeeHelper.delete(employee);
		return "Delete employee succesful!";
	}
}
