package com.oa.deskTop.entity;

import java.util.Date;

/**
 * Communication entity. @author MyEclipse Persistence Tools
 */

public class Communication {

	// Fields

	private int commId;
	private Date createTime;
	private String empName;
	private String empMobile;
	private String position;
	private String email;
	private String department;
	private int tid;
	private CommTypes commTypes = new CommTypes();

	// Constructors

	/** default constructor */
	public Communication() {
	}

	/** minimal constructor */
	public Communication(int tid) {
		this.tid = tid;
	}

	/** full constructor */
	public Communication(Date createTime, String empName,
			String empMobile, String position, String email, String department,
			int tid) {
		this.createTime = createTime;
		this.empName = empName;
		this.empMobile = empMobile;
		this.position = position;
		this.email = email;
		this.department = department;
		this.tid = tid;
	}

	

	public Communication(int commId, Date createTime, String empName,
			String empMobile, String position, String email, String department,
			int tid, CommTypes commTypes) {
		super();
		this.commId = commId;
		this.createTime = createTime;
		this.empName = empName;
		this.empMobile = empMobile;
		this.position = position;
		this.email = email;
		this.department = department;
		this.tid = tid;
		this.commTypes = commTypes;
	}

	public CommTypes getCommTypes() {
		return commTypes;
	}

	public void setCommTypes(CommTypes commTypes) {
		this.commTypes = commTypes;
	}

	public int getCommId() {
		return this.commId;
	}

	public void setCommId(int commId) {
		this.commId = commId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getEmpName() {
		return this.empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpMobile() {
		return this.empMobile;
	}

	public void setEmpMobile(String empMobile) {
		this.empMobile = empMobile;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getTid() {
		return this.tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

}