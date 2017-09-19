package com.oa.personnel.entity;

import java.util.Date;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */

public class Employee  {

	// Fields

	private int empId;
	private String empNo;
	private String empName;
	private Date empBirth;
	private String idCard;
	private String empDiploma;
	private String empExperience;
	private String empMoble;
	private String empEmail;
	private String deptName;
	private int deptId;
	private String company;
	private String position;
	private String picture;

	// Constructors

	/** default constructor */
	public Employee() {
	}

	/** minimal constructor */
	public Employee(String empNo, String empName, String deptName,int deptId) {
		this.empNo = empNo;
		this.empName = empName;
		this.deptName=deptName;
		this.deptId = deptId;
	}

	/** full constructor */
	public Employee(String empNo, String empName, Date empBirth,
			String idCard, String empDiploma, String empExperience,
			String empMoble, String empEmail,  String deptName,int deptId, String company,
			String position, String picture) {
		this.empNo = empNo;
		this.empName = empName;
		this.empBirth = empBirth;
		this.idCard = idCard;
		this.empDiploma = empDiploma;
		this.empExperience = empExperience;
		this.empMoble = empMoble;
		this.empEmail = empEmail;
		this.deptName=deptName;
		this.deptId = deptId;
		this.company = company;
		this.position = position;
		this.picture = picture;
	}

	// Property accessors

	public int getEmpId() {
		return this.empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpNo() {
		return this.empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return this.empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getEmpBirth() {
		return this.empBirth;
	}

	public void setEmpBirth(Date empBirth) {
		this.empBirth = empBirth;
	}

	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getEmpDiploma() {
		return this.empDiploma;
	}

	public void setEmpDiploma(String empDiploma) {
		this.empDiploma = empDiploma;
	}

	public String getEmpExperience() {
		return this.empExperience;
	}

	public void setEmpExperience(String empExperience) {
		this.empExperience = empExperience;
	}

	public String getEmpMoble() {
		return this.empMoble;
	}

	public void setEmpMoble(String empMoble) {
		this.empMoble = empMoble;
	}

	public String getEmpEmail() {
		return this.empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getDeptId() {
		return this.deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}