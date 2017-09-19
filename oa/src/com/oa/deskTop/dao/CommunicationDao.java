package com.oa.deskTop.dao;

import java.util.List;

import com.oa.deskTop.entity.Communication;

public interface CommunicationDao {
	public List<Communication> findAll();
	public List<Communication> findAll(int pageSize,int pageNo);
	public int computePageCount(int pageSize);
	public int insert(Communication comm);
	public int delete(int commId);
	public List<Communication> findByCondition(String empName,String department,String position,String empMobile);
	public Communication findByCommId(int commId);
	 public int updateComm(Communication comm);
}
