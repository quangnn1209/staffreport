package com.seta.staffreport.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class BaseController {
	// @ExceptionHandler(Throwable.class)
	// public String handleException(Throwable t) {
	// return "redirect:/errorPages/500.jsp";
	// }

	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Throwable t) {
		ModelAndView mav = new ModelAndView("goError");
		mav.addObject("message", t.getMessage());
		return mav;
	}
}
