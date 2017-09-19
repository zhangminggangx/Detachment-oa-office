package com.oa.rightmanagement.dao;

import java.util.List;

import com.oa.rightmanagement.entity.Role;

public interface RoleDao {
	public List<Role> findAll();
	public int insert(Role role);
	public int delete(int roleId);
	public int update(Role role);
	public Role findById(int roleId);
}
