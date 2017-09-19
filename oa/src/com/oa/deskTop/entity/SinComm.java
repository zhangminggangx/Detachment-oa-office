package com.oa.deskTop.entity;

/**
 * SinComm entity. @author MyEclipse Persistence Tools
 */

public class SinComm  {

	// Fields

	private int sinId;
	private int tid;
	private int uid;
	private int commId;
	private CommTypes commTypes = new CommTypes();
	private Communication comm = new Communication();

	// Constructors

	/** default constructor */
	public SinComm() {
	}

	/** full constructor */
	public SinComm(int tid, int uid, int commId) {
		this.tid = tid;
		this.uid = uid;
		this.commId = commId;
	}

	
	public SinComm(int sinId, int tid, int uid, int commId, CommTypes commTypes) {
		super();
		this.sinId = sinId;
		this.tid = tid;
		this.uid = uid;
		this.commId = commId;
		this.commTypes = commTypes;
	}

	public SinComm(int sinId, int tid, int uid, int commId,
			CommTypes commTypes, Communication comm) {
		super();
		this.sinId = sinId;
		this.tid = tid;
		this.uid = uid;
		this.commId = commId;
		this.commTypes = commTypes;
		this.comm = comm;
	}

	public Communication getComm() {
		return comm;
	}

	public void setComm(Communication comm) {
		this.comm = comm;
	}

	public CommTypes getCommTypes() {
		return commTypes;
	}

	public void setCommTypes(CommTypes commTypes) {
		this.commTypes = commTypes;
	}

	public int getSinId() {
		return this.sinId;
	}

	public void setSinId(int sinId) {
		this.sinId = sinId;
	}

	public int getTid() {
		return this.tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getCommId() {
		return this.commId;
	}

	public void setCommId(int commId) {
		this.commId = commId;
	}

}