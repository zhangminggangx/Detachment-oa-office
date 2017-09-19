package com.oa.personnel.service;

import java.util.List;

import com.oa.personnel.entity.UserInfo;

public interface UserInfoService {

	public UserInfo login(String uname,String upwd);
	public int register(UserInfo userinfo);
	public int addUser(UserInfo userInfo);
	public int removeUser(String empNo);
	public List<UserInfo> searchAll();
	public int updateRole(int uId,int roleId);
	public int updatepwd(int uId, String uPwd);

	
}
