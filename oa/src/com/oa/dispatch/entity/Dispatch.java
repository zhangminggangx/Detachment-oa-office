package com.oa.dispatch.entity;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import com.oa.personnel.entity.Employee;

/**
 * Dispatch entity. @author MyEclipse Persistence Tools
 */

public class Dispatch {

	// Fields

	private int disId;
	private String formNo;
	private int empId;
	private int deptId;
	private Date createTime;
	private double disMoney;
	private String disReason;
	private int state;
	private List<DisDetail> disDetailList= new ArrayList<DisDetail>();
	private Employee employee = new Employee();

	// Constructors

	/** default constructor */
	public Dispatch() {
	}

	/** minimal constructor */
	public Dispatch(String formNo, int empId, int deptId,
			double disMoney) {
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
		this.disMoney = disMoney;
	}

	/** full constructor */
	public Dispatch(String formNo, int empId, int deptId,
			Date createTime, double disMoney, String disReason,
			int state) {
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
		this.createTime = createTime;
		this.disMoney = disMoney;
		this.disReason = disReason;
		this.state = state;
	}

	
	
	

	
	public Dispatch(int disId, String formNo, int empId, int deptId,
			Date createTime, double disMoney, String disReason, int state,
			List<DisDetail> disDetailList, Employee employee) {
		super();
		this.disId = disId;
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
		this.createTime = createTime;
		this.disMoney = disMoney;
		this.disReason = disReason;
		this.state = state;
		this.disDetailList = disDetailList;
		this.employee = employee;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<DisDetail> getDisDetailList() {
		return disDetailList;
	}

	public void setDisDetailList(List<DisDetail> disDetailList) {
		this.disDetailList = disDetailList;
	}
	public int getDisId() {
		return this.disId;
	}
	public void setDisId(int disId) {
		this.disId = disId;
	}

	public String getFormNo() {
		return this.formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public int getEmpId() {
		return this.empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public int getDeptId() {
		return this.deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public double getDisMoney() {
		return this.disMoney;
	}

	public void setDisMoney(double disMoney) {
		this.disMoney = disMoney;
	}

	public String getDisReason() {
		return this.disReason;
	}

	public void setDisReason(String disReason) {
		this.disReason = disReason;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

}