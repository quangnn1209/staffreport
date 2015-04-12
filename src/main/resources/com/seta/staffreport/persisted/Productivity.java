package com.seta.staffreport.persisted;

// Generated Mar 2, 2015 10:31:43 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * Productivity generated by hbm2java
 */
public class Productivity implements java.io.Serializable {

    private Integer id;
    private Employees employees;
    private Date month;
    private String status;

    public Productivity() {
    }

    public Productivity(Employees employees, Date month, String status) {
        this.employees = employees;
        this.month = month;
        this.status = status;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Employees getEmployees() {
        return this.employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    public Date getMonth() {
        return this.month;
    }

    public void setMonth(Date month) {
        this.month = month;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
