package com.oa.documents.entity;

/**
 * Appendix entity. @author MyEclipse Persistence Tools
 */

public class Appendix 
	{

	// Fields

	private int appendId;
	private String fname;
	private int docId;
	private long capacity;

	// Constructors

	/** default constructor */
	public Appendix() {
	}

	/** minimal constructor */
	public Appendix(int docId) {
		this.docId = docId;
	}

	/** full constructor */
	public Appendix(String fname, int docId, long capacity) {
		this.fname = fname;
		this.docId = docId;
		this.capacity = capacity;
	}

	// Property accessors

	public int getAppendId() {
		return this.appendId;
	}

	public void setAppendId(int appendId) {
		this.appendId = appendId;
	}

	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getDocId() {
		return this.docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public long getCapacity() {
		return this.capacity;
	}

	public void setCapacity(long capacity) {
		this.capacity = capacity;
	}

}