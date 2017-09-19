package com.oa.travel.entity;

import java.util.Date;
import java.util.List;

/**
 * TravelApp entity. @author MyEclipse Persistence Tools
 */

public class TravelApp  {

	// Fields

	private int appId;
	private String formNo;
	private int empId;
	private int deptId;
	private String travelReason;
	private String travelPlace;
	private int planTime;
	private Date leaveTime;
	private String trafficTools;
	private double trafficFee;
	private Date orderTime;
	private String hotelName;
	private double roomFee;
	private String leavePlan;
	private String backPlan;
	private int state;
	private int wsId;
	private List<Goods> goodsList;

	// Constructors

	public int getWsId() {
		return wsId;
	}

	public void setWsId(int wsId) {
		this.wsId = wsId;
	}

	/** default constructor */
	public TravelApp() {
	}

	/** minimal constructor */
	public TravelApp(String formNo, int empId, int deptId) {
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
	}

	/** full constructor */
	public TravelApp(String formNo, int empId, int deptId,
			String travelReason, String travelPlace, int planTime,
			Date leaveTime, String trafficTools, double trafficFee,
			Date orderTime, String hotelName, double roomFee,
			String leavePlan, String backPlan, int state) {
		this.formNo = formNo;
		this.empId = empId;
		this.deptId = deptId;
		this.travelReason = travelReason;
		this.travelPlace = travelPlace;
		this.planTime = planTime;
		this.leaveTime = leaveTime;
		this.trafficTools = trafficTools;
		this.trafficFee = trafficFee;
		this.orderTime = orderTime;
		this.hotelName = hotelName;
		this.roomFee = roomFee;
		this.leavePlan = leavePlan;
		this.backPlan = backPlan;
		this.state = state;
	}

	// Property accessors

	public int getAppId() {
		return this.appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
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

	public String getTravelReason() {
		return this.travelReason;
	}

	public void setTravelReason(String travelReason) {
		this.travelReason = travelReason;
	}

	public String getTravelPlace() {
		return this.travelPlace;
	}

	public void setTravelPlace(String travelPlace) {
		this.travelPlace = travelPlace;
	}

	public int getPlanTime() {
		return this.planTime;
	}

	public void setPlanTime(int planTime) {
		this.planTime = planTime;
	}

	public Date getLeaveTime() {
		return this.leaveTime;
	}

	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
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

	public Date getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getHotelName() {
		return this.hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public double getRoomFee() {
		return this.roomFee;
	}

	public void setRoomFee(double roomFee) {
		this.roomFee = roomFee;
	}

	public String getLeavePlan() {
		return this.leavePlan;
	}

	public void setLeavePlan(String leavePlan) {
		this.leavePlan = leavePlan;
	}

	public String getBackPlan() {
		return this.backPlan;
	}

	public void setBackPlan(String backPlan) {
		this.backPlan = backPlan;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	

}