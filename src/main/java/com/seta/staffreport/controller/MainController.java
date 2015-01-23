package com.seta.staffreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String actionMain() {
		System.out.println("mainFunction..");
		return "index";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String actionHome() {
		System.out.println("homeFunction..");
		return "home";
	}
}
