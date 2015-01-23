package com.seta.staffreport.controller;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.seta.staffreport.common.Constant;

@Aspect
public class ControllerAspect {

	@Around("execution(* com.seta.staffreport.controller.*.*(..))")
	public Object beforeExecution(ProceedingJoinPoint point) throws Throwable {
		HttpSession session = (HttpSession) RequestContextHolder
				.currentRequestAttributes().resolveReference(
						RequestAttributes.REFERENCE_SESSION);
		System.out.println("Before: " + point.getSignature().getName());
		if (!"doLogin".equals(point.getSignature().getName())
				&& !"doLogout".equals(point.getSignature().getName())
				&& session.getAttribute(Constant.ADMIN_SESSION) == null) {
			System.err.println("Dont have permission");
			String signature = point.getSignature().toString();
			if ("ModelAndView".equals(signature.split(" ")[0])) {
				return new ModelAndView("index");
			} else {
				return "index";
			}
		}

		return point.proceed();
	}
}