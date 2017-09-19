package com.oa.rightmanagement.service;

import java.util.List;

import com.oa.rightmanagement.entity.Role;

public interface RoleService {
	public List<Role> searchAll();
	public int add(Role role);
	public int delete(int roleId);
	public Role findById(int roleId);

}
