package com.oa.rightmanagement.service;

import java.util.List;

import com.oa.rightmanagement.entity.FunACL;

public interface FunACLService {

	public List<FunACL> searchByRoleId(int roleId);
	public boolean hasPermission(String fcode,int roleId);
	public int add(int roleId,int funId);
}
