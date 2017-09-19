package com.oa.rightmanagement.dao;

import java.util.List;

import com.oa.rightmanagement.entity.FunACL;
import com.oa.rightmanagement.entity.ModuleFun;

public interface FunACLDao {
	public List<FunACL> findByRoleId(int roleId);
	public int insert(int roleId,int funId);
	public int deleteByRoleId(int roleId);
}
