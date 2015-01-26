package com.seta.staffreport.persisted;

// Generated Jan 23, 2015 10:32:31 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Team generated by hbm2java
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Team implements java.io.Serializable {
	private Integer teamId;
	private Division division;
	private String teamName;
	private Date createDate;
	private Date endDate;
	private Set employeeses = new HashSet(0);

	public Team() {
	}

	public Team(Division division, String teamName, Date createDate) {
		this.division = division;
		this.teamName = teamName;
		this.createDate = createDate;
	}

	public Team(Division division, String teamName, Date createDate, Date endDate, Set employeeses) {
		this.division = division;
		this.teamName = teamName;
		this.createDate = createDate;
		this.endDate = endDate;
		this.employeeses = employeeses;
	}

	public Integer getTeamId() {
		return this.teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public Division getDivision() {
		return this.division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	public String getTeamName() {
		return this.teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Set getEmployeeses() {
		return this.employeeses;
	}

	public void setEmployeeses(Set employeeses) {
		this.employeeses = employeeses;
	}

}
