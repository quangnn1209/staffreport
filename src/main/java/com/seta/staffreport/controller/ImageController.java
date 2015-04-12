package com.seta.staffreport.controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seta.staffreport.common.Constant;
import com.seta.staffreport.common.EmployeeHelper;
import com.seta.staffreport.common.ImageHelper;
import com.seta.staffreport.persisted.Employees;
import com.seta.staffreport.persisted.File;
import com.seta.staffreport.persisted.Image;

@Controller
public class ImageController extends BaseController {
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public @ResponseBody Image uploadFile(MultipartHttpServletRequest request) {
		Image img = new Image();

		try {
			Employees emp = new Employees(Integer.parseInt(request.getParameter("empId")));
			emp = EmployeeHelper.getPersistantObject(emp);

			// 1. build an iterator
			Iterator<String> itr = request.getFileNames();
			MultipartFile mpf = null;

			// 2. get each file
			while (itr.hasNext()) {

				// 2.1 get next MultipartFile
				mpf = request.getFile(itr.next());

				if (mpf.getOriginalFilename().length() > Constant.MAX_FILE_NAME) {
					return null;
				}

				if (mpf.getBytes().length > Constant.MAX_FILE_SIZE) {
					return null;
				}

				// 2.3 create new fileMeta
				File fileMeta = new File();
				fileMeta.setFileName(mpf.getOriginalFilename());
				fileMeta.setContent(mpf.getBytes());

				img.setFile(fileMeta);
				img.setName(mpf.getOriginalFilename());

				ImageHelper.saveOrUpdate(img);
				emp.setImage(img);
				EmployeeHelper.saveOrUpdate(emp);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return img;
	}

	@RequestMapping(value = "getImage/{id}", method = RequestMethod.GET)
	public void get(HttpServletResponse response, @PathVariable String id) {
		try {
			Image img = new Image(Integer.parseInt(id));
			img = ImageHelper.getPersistantObject(img);
			File file = img.getFile();
			String[] fileType = file.getFileName().split("\\.");
			response.setContentType(fileType[fileType.length - 1]);
			response.setHeader("Content-disposition", "attachment; filename=\"" + file.getFileName() + "\"");
			FileCopyUtils.copy(file.getContent(), response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
