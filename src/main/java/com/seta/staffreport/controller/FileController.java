package com.seta.staffreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seta.staffreport.persisted.File;

@Controller
public class FileController {
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public @ResponseBody
	String uploadFile(File file) {

		return "";
	}
}
