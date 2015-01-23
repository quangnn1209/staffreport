package com.seta.staffreport.persisted;

// Generated Jan 23, 2015 10:32:31 AM by Hibernate Tools 3.4.0.CR1

/**
 * Admin generated by hbm2java
 */
public class Admin implements java.io.Serializable {

	private Integer adminId;
	private Employees employees;
	private String username;
	private String password;

	public Admin() {
	}

	public Admin(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Admin(Employees employees, String username, String password) {
		this.employees = employees;
		this.username = username;
		this.password = password;
	}

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Employees getEmployees() {
		return this.employees;
	}

	public void setEmployees(Employees employees) {
		this.employees = employees;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
