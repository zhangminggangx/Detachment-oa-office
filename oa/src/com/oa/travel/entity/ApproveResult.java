package com.oa.travel.entity;

import java.util.Date;

import com.oa.personnel.entity.Employee;

/**
 * ApproveResult entity. @author MyEclipse Persistence Tools
 */

public class ApproveResult{

	// Fields

	private int arId;
	private String formNo;
	private int wsId;
	private Date approveTime;
	private int resultId;
	private String approveReason;
    private Result result=new Result();
    private Employee employee=new Employee();
	// Constructors

	public Result getResult() {
		return result;
	}

	public void setResult(Result result) {
		this.result = result;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	/** default constructor */
	public ApproveResult() {
	}

	/** minimal constructor */
	public ApproveResult(String formNo, int wsId, int resultId) {
		this.formNo = formNo;
		this.wsId = wsId;
		this.resultId = resultId;
	}

	/** full constructor */
	public ApproveResult(String formNo, int wsId, Date approveTime,
			int resultId, String approveReason) {
		this.formNo = formNo;
		this.wsId = wsId;
		this.approveTime = approveTime;
		this.resultId = resultId;
		this.approveReason = approveReason;
	}

	// Property accessors

	public int getArId() {
		return this.arId;
	}

	public void setArId(int arId) {
		this.arId = arId;
	}

	public String getFormNo() {
		return this.formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public int getWsId() {
		return this.wsId;
	}

	public void setWsId(int wsId) {
		this.wsId = wsId;
	}

	public Date getApproveTime() {
		return this.approveTime;
	}

	public void setApproveTime(Date approveTime) {
		this.approveTime = approveTime;
	}

	public int getResultId() {
		return this.resultId;
	}

	public void setResultId(int resultId) {
		this.resultId = resultId;
	}

	public String getApproveReason() {
		return this.approveReason;
	}

	public void setApproveReason(String approveReason) {
		this.approveReason = approveReason;
	}

}