package com.oa.deskTop.entity;

import java.util.Date;

import com.oa.personnel.entity.UserInfo;

/**
 * Memo entity. @author MyEclipse Persistence Tools
 */

public class Memo  {

	// Fields

	private int memoId;
	private String title;
	private String contents;
	private Date createTime;
	private int uid;
    private UserInfo userInfo=new UserInfo();
	// Constructors

	/** default constructor */
	public Memo() {
	}

	/** minimal constructor */
	public Memo(int uid) {
		this.uid = uid;
	}

	/** full constructor */
	public Memo(String title, String contents, Date createTime, int uid) {
		this.title = title;
		this.contents = contents;
		this.createTime = createTime;
		this.uid = uid;
	}

	// Property accessors

	public int getMemoId() {
		return this.memoId;
	}

	public void setMemoId(int memoId) {
		this.memoId = memoId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return this.contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

}