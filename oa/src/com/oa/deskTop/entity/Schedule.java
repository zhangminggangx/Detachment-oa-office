package com.oa.deskTop.entity;


/**
 * Schedule entity. @author MyEclipse Persistence Tools
 */

public class Schedule {

	// Fields
	private int scdId;
	private String start;
	private String end;
	private String title;
	private String place;
	private String contents;
	private int uid;
	public int getScdId() {
		return scdId;
	}
	public void setScdId(int scdId) {
		this.scdId = scdId;
	}
	
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	

}