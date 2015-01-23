package com.seta.staffreport.persisted;

// Generated Jan 23, 2015 10:32:31 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * Employeehistory generated by hbm2java
 */
public class Employeehistory implements java.io.Serializable {

	private Integer empHistoryId;
	private Employees employees;
	private String teamName;
	private String divisionName;
	private Date startDate;
	private Date endDate;

	public Employeehistory() {
	}

	public Employeehistory(Employees employees, Date startDate) {
		this.employees = employees;
		this.startDate = startDate;
	}

	public Employeehistory(Employees employees, String teamName,
			String divisionName, Date startDate, Date endDate) {
		this.employees = employees;
		this.teamName = teamName;
		this.divisionName = divisionName;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Integer getEmpHistoryId() {
		return this.empHistoryId;
	}

	public void setEmpHistoryId(Integer empHistoryId) {
		this.empHistoryId = empHistoryId;
	}

	public Employees getEmployees() {
		return this.employees;
	}

	public void setEmployees(Employees employees) {
		this.employees = employees;
	}

	public String getTeamName() {
		return this.teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getDivisionName() {
		return this.divisionName;
	}

	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}
