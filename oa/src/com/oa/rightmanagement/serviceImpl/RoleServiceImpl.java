package com.oa.rightmanagement.serviceImpl;

import java.util.List;

import com.oa.personnel.daoImpl.UserInfoDaoImpl;
import com.oa.rightmanagement.daoImpl.FunACLDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleAclDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleDaoImpl;
import com.oa.rightmanagement.daoImpl.RoleDaoImpl;
import com.oa.rightmanagement.entity.Role;
import com.oa.rightmanagement.service.RoleService;

public class RoleServiceImpl implements RoleService{

	private RoleDaoImpl roleDaoImpl=new RoleDaoImpl();
	private ModuleAclDaoImpl moduleAclDaoImpl=new ModuleAclDaoImpl();
	private UserInfoDaoImpl userInfoDaoImpl=new UserInfoDaoImpl();
	private FunACLDaoImpl funACLDaoImpl=new FunACLDaoImpl();
	public List<Role> searchAll() {
		return roleDaoImpl.findAll();
	}
	public int add(Role role){
		return roleDaoImpl.insert(role);
		
	}
	public int delete(int roleId) {
		
		return roleDaoImpl.delete(roleId)+moduleAclDaoImpl.delete(roleId)+userInfoDaoImpl.updateRoleId(roleId)+funACLDaoImpl.deleteByRoleId(roleId);
	}
	public Role findById(int roleId) {
		return roleDaoImpl.findById(roleId);
	}
	

}
