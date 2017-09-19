package com.oa.dispatch.dao;

import java.util.List;

import com.oa.dispatch.entity.Dispatch;

public interface DispatchDao {
	public Dispatch findByDisId(int disId);
	public Dispatch findByFormNo(String formNo);
	public List<Dispatch> findByEmpId(int empId);
	public List<Dispatch> findByEmpId(int empId,int state);
	public List<Dispatch> findByEmpId(int empId,int state,int pageSize,int pageNo);
	public int insert(Dispatch dispatch);
	public int delete(int disId);
	public int computePageCount(int pageSize,int empId,int state);
	

	public List<Dispatch> findByEmpId(int empId,int pageSize,int pageNo);
	public int computePageCount(int pageSize,int empId);
	
	public int findMaxId();
	public int updateState(String formNo,int state);
	public int updateDispatch(Dispatch dis);
	

	
	

}
