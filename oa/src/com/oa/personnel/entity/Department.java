package com.oa.personnel.entity;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department {

	// Fields

	private int deptId;
	private String deptName;
	private String deptCharger;

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** minimal constructor */
	public Department(String deptName) {
		this.deptName = deptName;
	}

	/** full constructor */
	public Department(String deptName, String deptCharger) {
		this.deptName = deptName;
		this.deptCharger = deptCharger;
	}

	// Property accessors

	public int getDeptId() {
		return this.deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptCharger() {
		return this.deptCharger;
	}

	public void setDeptCharger(String deptCharger) {
		this.deptCharger = deptCharger;
	}

}