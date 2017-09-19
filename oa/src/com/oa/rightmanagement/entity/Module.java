package com.oa.rightmanagement.entity;

public class Module {
	private int modId;
	private String modName;
	private int modState;
	private int modParentId;
	public int getModId() {
		return modId;
	}
	public void setModId(int modId) {
		this.modId = modId;
	}
	public String getModName() {
		return modName;
	}
	public void setModName(String modName) {
		this.modName = modName;
	}
	public int getModState() {
		return modState;
	}
	public void setModState(int modState) {
		this.modState = modState;
	}
	public void setModParentId(int modParentId) {
		this.modParentId = modParentId;
	}
	public int getModParentId() {
		return modParentId;
	}
	
	@Override
	public boolean equals(Object obj) {
		Module mod=(Module)obj;
		if(this.modParentId==mod.getModParentId()&&mod.getModParentId()!=0&&this.modParentId!=0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	@Override
	public int hashCode() {
		return this.modId+this.modName.hashCode();
	}
	 
	
}
