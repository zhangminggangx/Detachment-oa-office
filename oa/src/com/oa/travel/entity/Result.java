package com.oa.travel.entity;

/**
 * Result entity. @author MyEclipse Persistence Tools
 */

public class Result  {

	// Fields

	private int resId;
	private String resName;

	// Constructors

	/** default constructor */
	public Result() {
	}

	/** full constructor */
	public Result(String resName) {
		this.resName = resName;
	}

	// Property accessors

	public int getResId() {
		return this.resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public String getResName() {
		return this.resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

}