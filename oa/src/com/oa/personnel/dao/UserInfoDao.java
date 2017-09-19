package com.oa.personnel.dao;

import java.util.List;

import com.oa.personnel.entity.UserInfo;



public interface UserInfoDao {
  public List<UserInfo> findAll();
  public List<UserInfo> findAll(int pageSize,int pageNo);
  public int computePageCount(int pageSize);
  public UserInfo findById(int uId);
  public int insert(UserInfo u);
  public int delete(int uId);
  public UserInfo findByUNamePwd(String username,String pwd);
  public int delete(String empNo);
  public int updateRole(int uId,int roleId);
  int updatepwd(int id,String upwd);
  public int updateRoleId(int roleId);
}
