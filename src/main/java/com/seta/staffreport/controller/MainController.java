package com.seta.staffreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String mainFunction(){
		return "login";
	}
	@RequestMapping(value="home",method = RequestMethod.POST)
	public String homeFunction(){
		return "home";
	}
}
