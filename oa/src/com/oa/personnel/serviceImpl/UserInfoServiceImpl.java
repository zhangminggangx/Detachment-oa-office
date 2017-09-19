package com.oa.personnel.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.oa.personnel.daoImpl.UserInfoDaoImpl;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.UserInfoService;
import com.oa.rightmanagement.daoImpl.RoleDaoImpl;
import com.oa.rightmanagement.entity.Role;
import com.oa.rightmanagement.serviceImpl.RoleServiceImpl;

public class UserInfoServiceImpl implements UserInfoService{

	private UserInfoDaoImpl impl=new UserInfoDaoImpl();
	private RoleDaoImpl roleDaoImpl=new RoleDaoImpl();
	public UserInfo login(String uname, String upwd) {
		
		return impl.findByUNamePwd(uname, upwd);
	}

	public int register(UserInfo userinfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addUser(UserInfo userInfo) {
		return impl.insert(userInfo);
	}

	public int removeUser(String empNo) {
		return impl.delete(empNo);
	}

	public List<UserInfo> searchAll() {
		List<UserInfo> userInfos=impl.findAll();
		for(UserInfo u:userInfos)
		{
			int roleId=u.getRoleId();
			Role role=roleDaoImpl.findById(roleId);
			u.setRole(role);
			
		}
		return userInfos;
	}
	public int updateRole(int uId, int roleId) {
		return impl.updateRole(uId, roleId);
	}
	
	/*
	 * ÐÞ¸ÄÃÜÂë
	 * */
	public int updatepwd(int uId, String uPwd) {
		return impl.updatepwd(uId, uPwd);
	}

}
