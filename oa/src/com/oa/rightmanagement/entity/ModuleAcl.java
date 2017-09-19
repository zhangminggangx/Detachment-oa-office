package com.oa.rightmanagement.entity;

public class ModuleAcl {
	public int getRoleModId() {
		return roleModId;
	}
	public void setRoleModId(int roleModId) {
		this.roleModId = roleModId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getModId() {
		return modId;
	}
	public void setModId(int modId) {
		this.modId = modId;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public Module getModule() {
		return module;
	}
	private int roleModId;
	private int roleId;
	private int modId;
	private Module module=new Module();

}
