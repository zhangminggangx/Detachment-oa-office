package com.oa.travel.entity;

/**
 * TravelReport entity. @author MyEclipse Persistence Tools
 */

public class TravelReport {

	// Fields

	private int reportId;
	private String formNo;
	private int empId;
	private int deptId;
	private int realTime;
	private String trafficTools;
	private double trafficFee;
	private String hotelName;
	private int politicId;
	private double disMoney;
	private int appId;
	private String customs;
	private String summery;
	private int state;
	private String AppFromNo;
	private int wsId;

	// Constructors

	/** default constructor */
	public TravelReport() {
	}

	/** minimal constructor */
	public TravelReport(String formNo, int empId, int deptId,
			int politicId, int appId) {
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
		this.politicId = politicId;
		this.appId = appId;
	}

	/** full constructor */
	public TravelReport(String formNo, int empId, int deptId,
			int realTime, String trafficTools, double trafficFee,
			String hotelName, int politicId, double disMoney,
			int appId, String customs, String summery, int state) {
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
		this.realTime = realTime;
		this.trafficTools = trafficTools;
		this.trafficFee = trafficFee;
		this.hotelName = hotelName;
		this.politicId = politicId;
		this.disMoney = disMoney;
		this.appId = appId;
		this.customs = customs;
		this.summery = summery;
		this.state = state;
	}

	// Property accessors

	public int getReportId() {
		return this.reportId;
	}

	public int getWsId() {
		return wsId;
	}

	public void setWsId(int wsId) {
		this.wsId = wsId;
	}

	public String getAppFromNo() {
		return AppFromNo;
	}

	public void setAppFromNo(String appFromNo) {
		AppFromNo = appFromNo;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
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

	public int getRealTime() {
		return this.realTime;
	}

	public void setRealTime(int realTime) {
		this.realTime = realTime;
	}

	public String getTrafficTools() {
		return this.trafficTools;
	}

	public void setTrafficTools(String trafficTools) {
		this.trafficTools = trafficTools;
	}

	public double getTrafficFee() {
		return this.trafficFee;
	}

	public void setTrafficFee(double trafficFee) {
		this.trafficFee = trafficFee;
	}

	public String getHotelName() {
		return this.hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getPoliticId() {
		return this.politicId;
	}

	public void setPoliticId(int politicId) {
		this.politicId = politicId;
	}

	public double getDisMoney() {
		return this.disMoney;
	}

	public void setDisMoney(double disMoney) {
		this.disMoney = disMoney;
	}

	public int getAppId() {
		return this.appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getCustoms() {
		return this.customs;
	}

	public void setCustoms(String customs) {
		this.customs = customs;
	}

	public String getSummery() {
		return this.summery;
	}

	public void setSummery(String summery) {
		this.summery = summery;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

}