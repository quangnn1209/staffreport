package com.seta.staffreport.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class ControllerAspect {

	@Before("execution(* com.seta.staffreport.controller.*.*(..))")
	public void beforeExecution(JoinPoint joinPoint) {
		System.out.println("beforeExecution..");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("******");
	}
}