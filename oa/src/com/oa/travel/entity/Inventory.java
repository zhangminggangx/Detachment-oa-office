package com.oa.travel.entity;

/**
 * Inventory entity. @author MyEclipse Persistence Tools
 */

public class Inventory {

	// Fields

	private int inventId;
	private String goodsName;
	private int store;
	private double price;
	private String types;

	// Constructors

	/** default constructor */
	public Inventory() {
	}

	/** full constructor */
	public Inventory(String goodsName, int store, double price, String types) {
		this.goodsName = goodsName;
		this.store = store;
		this.price = price;
		this.types = types;
	}

	// Property accessors

	public int getInventId() {
		return this.inventId;
	}

	public void setInventId(int inventId) {
		this.inventId = inventId;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getStore() {
		return this.store;
	}

	public void setStore(int store) {
		this.store = store;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTypes() {
		return this.types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

}