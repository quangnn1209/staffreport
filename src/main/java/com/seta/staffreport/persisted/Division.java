package com.seta.staffreport.persisted;

// Generated Jan 27, 2015 2:55:26 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Division generated by hbm2java
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Division implements java.io.Serializable {

	private Integer divisionId;
	private String divisionName;
	private Set teams = new HashSet(0);
	private Set employeeses = new HashSet(0);

	public Division() {
	}

	public Division(String divisionName) {
		this.divisionName = divisionName;
	}

	public Division(String divisionName, Set teams, Set employeeses) {
		this.divisionName = divisionName;
		this.teams = teams;
		this.employeeses = employeeses;
	}

	public Integer getDivisionId() {
		return this.divisionId;
	}

	public void setDivisionId(Integer divisionId) {
		this.divisionId = divisionId;
	}

	public String getDivisionName() {
		return this.divisionName;
	}

	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}

	public Set getTeams() {
		return this.teams;
	}

	public void setTeams(Set teams) {
		this.teams = teams;
	}

	public Set getEmployeeses() {
		return this.employeeses;
	}

	public void setEmployeeses(Set employeeses) {
		this.employeeses = employeeses;
	}

}
