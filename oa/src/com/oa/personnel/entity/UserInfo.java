package com.oa.personnel.entity;

import com.oa.rightmanagement.entity.Role;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class UserInfo  {

	// Fields

	private int uid;
	private String empNo;
	private String upwd;
	private String empName;
	private String deptName;
	private int empId;
	private String filePath;
	private String comEmail;
	private long fileCapacity;
	private int roleId;
    private Role role=new Role();
	// Constructors

	/** default constructor */
	public UserInfo() {
	}


	// Property accessors

	public String getEmpNo() {
		return empNo;
	}


	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}




	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUpwd() {
		return this.upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public int getRoleId() {
		return roleId;
	}


	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}


	public int getEmpId() {
		return this.empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getComEmail() {
		return this.comEmail;
	}

	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}

	public long getFileCapacity() {
		return this.fileCapacity;
	}

	public void setFileCapacity(long fileCapacity) {
		this.fileCapacity = fileCapacity;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setRole(Role role) {
		this.role = role;
	}


	public Role getRole() {
		return role;
	}

}