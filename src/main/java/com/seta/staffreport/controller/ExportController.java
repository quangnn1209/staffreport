package com.seta.staffreport.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seta.staffreport.common.DivisionHelper;
import com.seta.staffreport.common.Utils;
import com.seta.staffreport.persisted.Division;

@Controller
public class ExportController extends BaseController {

	@RequestMapping(value = "export", method = RequestMethod.GET)
	public void export(HttpServletResponse response) {
		try {
			// Prepare data
			List<Division> divisionList = DivisionHelper.getAllDivisions();

			Map beans = new HashMap();
			beans.put("divisionList", divisionList);
			XLSTransformer transformer = new XLSTransformer();
			XSSFWorkbook resultWorkbook = (XSSFWorkbook) transformer.transformXLS(
					getClass().getResourceAsStream("/template/ReportTemplate.xlsx"), beans);
			// Set response
			String fileName = URLEncoder.encode("SETA-ASIAのチーム毎人数と稼働率_" + Utils.formatDate(new Date()), "UTF-8");
			response.setContentType("application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			resultWorkbook.write(baos);
			FileCopyUtils.copy(baos.toByteArray(), response.getOutputStream());
			baos.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParsePropertyException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
