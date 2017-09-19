package com.oa.travel.entity;

import com.oa.dispatch.entity.Dispatch;

/**
 * WorkStream entity. @author MyEclipse Persistence Tools
 */

public class WorkStream {

	// Fields

	private int wsId;
	private String formNo;
	private int toId;
	private int fromId;
	private boolean hasApproved;
	private Dispatch dispatch = new Dispatch();
	private ApproveResult appResult = new ApproveResult();

	// Constructors

	/** default constructor */
	public WorkStream() {
	}

	/** minimal constructor */
	public WorkStream(String formNo, int toId, int fromId) {
		this.formNo = formNo;
		this.toId = toId;
		this.fromId = fromId;
	}

	/** full constructor */
	public WorkStream(String formNo, int toId, int fromId,
			boolean hasApproved) {
		this.formNo = formNo;
		this.toId = toId;
		this.fromId = fromId;
		this.hasApproved = hasApproved;
	}
	
	

	public WorkStream(int wsId, String formNo, int toId, int fromId,
			boolean hasApproved, Dispatch dispatch) {
		super();
		this.wsId = wsId;
		this.formNo = formNo;
		this.toId = toId;
		this.fromId = fromId;
		this.hasApproved = hasApproved;
		this.dispatch = dispatch;
	}

	// Property accessors

	
	


	public Dispatch getDispatch() {
		return dispatch;
	}

	public WorkStream(int wsId, String formNo, int toId, int fromId,
			boolean hasApproved, Dispatch dispatch, ApproveResult appResult) {
		super();
		this.wsId = wsId;
		this.formNo = formNo;
		this.toId = toId;
		this.fromId = fromId;
		this.hasApproved = hasApproved;
		this.dispatch = dispatch;
		this.appResult = appResult;
	}

	public ApproveResult getAppResult() {
		return appResult;
	}

	public void setAppResult(ApproveResult appResult) {
		this.appResult = appResult;
	}

	public void setDispatch(Dispatch dispatch) {
		this.dispatch = dispatch;
	}
	
	public int getWsId() {
		return this.wsId;
	}
	public void setWsId(int wsId) {
		this.wsId = wsId;
	}

	public String getFormNo() {
		return this.formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public int getToId() {
		return this.toId;
	}

	public void setToId(int toId) {
		this.toId = toId;
	}

	public int getFromId() {
		return this.fromId;
	}

	public void setFromId(int fromId) {
		this.fromId = fromId;
	}

	public boolean getHasApproved() {
		return this.hasApproved;
	}

	public void setHasApproved(boolean hasApproved) {
		this.hasApproved = hasApproved;
	}

}