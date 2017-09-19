package com.oa.rightmanagement.entity;

public class FunACL {
	 private int roleFunId;
	 private int roleId;
	 private int funId;
	 private ModuleFun moduleFun=new ModuleFun();
	public int getRoleFunId() {
		return roleFunId;
	}
	public void setRoleFunId(int roleFunId) {
		this.roleFunId = roleFunId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getFunId() {
		return funId;
	}
	public void setFunId(int funId) {
		this.funId = funId;
	}
	public void setModuleFun(ModuleFun moduleFun) {
		this.moduleFun = moduleFun;
	}
	public ModuleFun getModuleFun() {
		return moduleFun;
	}
	 
}
