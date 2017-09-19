package com.oa.dispatch.entity;

/**
 * DisDetail entity. @author MyEclipse Persistence Tools
 */

public class DisDetail  {

	// Fields

	private int detailId;
	private int disId;
	private int proId;
	private double detailMoney;
	private String description;
	private DisProject disProject =new DisProject();

	// Constructors

	/** default constructor */
	public DisDetail() {
	}

	/** minimal constructor */
	public DisDetail(int disId, int proId, double detailMoney) {
		this.disId = disId;
		this.proId = proId;
		this.detailMoney = detailMoney;
	}

	/** full constructor */
	public DisDetail(int disId, int proId, double detailMoney,
			String description) {
		this.disId = disId;
		this.proId = proId;
		this.detailMoney = detailMoney;
		this.description = description;
	}
	
	public DisDetail(int detailId, int disId, int proId, double detailMoney,
			String description) {
		super();
		this.detailId = detailId;
		this.disId = disId;
		this.proId = proId;
		this.detailMoney = detailMoney;
		this.description = description;
	}

	public DisDetail(int detailId, int disId, int proId, double detailMoney,
			String description, DisProject disProject) {
		super();
		this.detailId = detailId;
		this.disId = disId;
		this.proId = proId;
		this.detailMoney = detailMoney;
		this.description = description;
		this.disProject = disProject;
	}

	// Property accessors

	public DisProject getDisProject() {
		return disProject;
	}

	public void setDisProject(DisProject disProject) {
		this.disProject = disProject;
	}

	public int getDetailId() {
		return this.detailId;
	}

	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}

	public int getDisId() {
		return this.disId;
	}

	public void setDisId(int disId) {
		this.disId = disId;
	}

	public int getProId() {
		return this.proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public double getDetailMoney() {
		return this.detailMoney;
	}

	public void setDetailMoney(double detailMoney) {
		this.detailMoney = detailMoney;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}