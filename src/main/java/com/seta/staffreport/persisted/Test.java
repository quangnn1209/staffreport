package com.seta.staffreport.persisted;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

// Generated Jan 23, 2015 10:32:31 AM by Hibernate Tools 3.4.0.CR1

/**
 * Test generated by hbm2java
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Test implements java.io.Serializable {

	private Integer testId;
	private String testName;

	public Test() {
	}

	public Test(String testName) {
		this.testName = testName;
	}

	public Integer getTestId() {
		return this.testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	public String getTestName() {
		return this.testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

}
