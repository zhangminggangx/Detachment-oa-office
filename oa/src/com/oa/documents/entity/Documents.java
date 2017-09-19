package com.oa.documents.entity;

import java.util.Date;

import com.oa.personnel.entity.UserInfo;

/**
 * Documents entity. @author MyEclipse Persistence Tools
 */

public class Documents  {

	// Fields

	private int docId;
	private String virtualPath;
	private String title;
	private String note;
	private Date createTime;
	private int uid;
	private int parentId;
    private UserInfo userInfo=new  UserInfo();
	// Constructors

	/** default constructor */
	public Documents() {
	}

	/** minimal constructor */
	public Documents(int uid, int parentId) {
		this.uid = uid;
		this.parentId = parentId;
	}

	/** full constructor */
	public Documents(String virtualPath, String title, String note,
			Date createTime, int uid, int parentId) {
		this.virtualPath = virtualPath;
		this.title = title;
		this.note = note;
		this.createTime = createTime;
		this.uid = uid;
		this.parentId = parentId;
	}

	// Property accessors

	public int getDocId() {
		return this.docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getVirtualPath() {
		return this.virtualPath;
	}

	public void setVirtualPath(String virtualPath) {
		this.virtualPath = virtualPath;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getParentId() {
		return this.parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

}