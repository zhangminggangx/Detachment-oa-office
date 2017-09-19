package com.oa.travel.entity;

/**
 * Received entity. @author MyEclipse Persistence Tools
 */

public class Received  {

	// Fields

	private int recId;
	private String recName;
	private int reccount;
	private int reportId;
	private boolean hasPut;

	// Constructors

	/** default constructor */
	public Received() {
	}

	/** minimal constructor */
	public Received(int reportId) {
		this.reportId = reportId;
	}

	/** full constructor */
	public Received(String recName, int reccount, int reportId,
			boolean hasPut) {
		this.recName = recName;
		this.reccount = reccount;
		this.reportId = reportId;
		this.hasPut = hasPut;
	}

	// Property accessors

	public int getRecId() {
		return this.recId;
	}

	public void setRecId(int recId) {
		this.recId = recId;
	}

	public String getRecName() {
		return this.recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public int getReccount() {
		return this.reccount;
	}

	public void setReccount(int reccount) {
		this.reccount = reccount;
	}

	public int getReportId() {
		return this.reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public boolean getHasPut() {
		return this.hasPut;
	}

	public void setHasPut(boolean hasPut) {
		this.hasPut = hasPut;
	}

}