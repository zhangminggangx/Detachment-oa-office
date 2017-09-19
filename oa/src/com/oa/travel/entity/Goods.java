package com.oa.travel.entity;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods  {

	// Fields

	private int goodsId;
	private int inventId;
	private int appId;
	private boolean hasReturn;
	private String goodsName;
	

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(int inventId, int appId) {
		this.inventId = inventId;
		this.appId = appId;
	}

	/** full constructor */
	public Goods(int inventId, int appId, boolean hasReturn) {
		this.inventId = inventId;
		this.appId = appId;
		this.hasReturn = hasReturn;
	}

	
	// Property accessors

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getInventId() {
		return this.inventId;
	}

	public void setInventId(int inventId) {
		this.inventId = inventId;
	}

	public int getAppId() {
		return this.appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public boolean getHasReturn() {
		return this.hasReturn;
	}

	public void setHasReturn(boolean hasReturn) {
		this.hasReturn = hasReturn;
	}

}