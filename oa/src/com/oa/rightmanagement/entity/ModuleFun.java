package com.oa.rightmanagement.entity;

public class ModuleFun {
	 private int funId;
	 private int modId;
	 private String funName;
	 private String funCode;
	 private int funState;
	 private Module module=new Module();
	 
	public int getFunId() {
		return funId;
	}
	public void setFunId(int funId) {
		this.funId = funId;
	}
	public int getModId() {
		return modId;
	}
	public void setModId(int modId) {
		this.modId = modId;
	}
	public String getFunName() {
		return funName;
	}
	public void setFunName(String funName) {
		this.funName = funName;
	}
	public String getFunCode() {
		return funCode;
	}
	public void setFunCode(String funCode) {
		this.funCode = funCode;
	}
	public int getFunState() {
		return funState;
	}
	public void setFunState(int funState) {
		this.funState = funState;
	}
	
	public void setModule(Module module) {
		this.module = module;
	}
	public Module getModule() {
		return module;
	}

}
