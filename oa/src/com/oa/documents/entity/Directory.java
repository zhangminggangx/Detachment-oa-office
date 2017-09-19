package com.oa.documents.entity;

/**
 * Directory entity. @author MyEclipse Persistence Tools
 */

public class Directory  {

	// Fields

	private int dirId;
	private int parentId;
	private String dirName;
	private int uid;

	// Constructors

	/** default constructor */
	public Directory() {
	}

	/** full constructor */
	public Directory(int parentId, String dirName, int uid) {
		this.parentId = parentId;
		this.dirName = dirName;
		this.uid = uid;
	}

	// Property accessors

	public int getDirId() {
		return this.dirId;
	}

	public void setDirId(int dirId) {
		this.dirId = dirId;
	}

	public int getParentId() {
		return this.parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getDirName() {
		return this.dirName;
	}

	public void setDirName(String dirName) {
		this.dirName = dirName;
	}

	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

}