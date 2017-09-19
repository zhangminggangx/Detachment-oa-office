package com.oa.deskTop.dao;

import java.util.List;

import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.entity.SinComm;

public interface SinCommDao {
	public List<SinComm> findByTypeId(int uId,int tId);
	public List<SinComm> findByTypeId(int pageNo,int pageSize,int uId,int tId);
	public List<SinComm> findAll(int pageNo,int pageSize,int uId);
	public List<SinComm> findAll(int uId);
	public int insert (SinComm comm);
	public int delete(int commId);
	
	
	
	
	

}
