package com.oa.travel.entity;

/**
 * Present entity. @author MyEclipse Persistence Tools
 */

public class Present {

	// Fields

	private int preId;
	private int inventId;
	private int appId;
	private String goodsName;
	private int store;
	private double price;
	
	public int getStore() {
		return store;
	}

	public void setStore(int store) {
		this.store = store;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	

	// Constructors

	/** default constructor */
	public Present() {
	}

	/** full constructor */
	public Present(int inventId, int appId) {
		this.inventId = inventId;
		this.appId = appId;
	}

	// Property accessors

	public int getPreId() {
		return this.preId;
	}

	public void setPreId(int preId) {
		this.preId = preId;
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

}