package com.oa.deskTop.entity;

/**
 * CommTypes entity. @author MyEclipse Persistence Tools
 */

public class CommTypes{

	// Fields

	private int tid;
	private String tname;

	// Constructors

	/** default constructor */
	public CommTypes() {
	}

	/** full constructor */
	public CommTypes(String tname) {
		this.tname = tname;
	}

	// Property accessors

	public int getTid() {
		return this.tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

}