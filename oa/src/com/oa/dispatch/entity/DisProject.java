package com.oa.dispatch.entity;

/**
 * DisProject entity. @author MyEclipse Persistence Tools
 */

public class DisProject {

	// Fields

	private int proId;
	private String proName;

	// Constructors

	/** default constructor */
	public DisProject() {
	}

	/** full constructor */
	public DisProject(String proName) {
		this.proName = proName;
	}

	// Property accessors

	public int getProId() {
		return this.proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

}