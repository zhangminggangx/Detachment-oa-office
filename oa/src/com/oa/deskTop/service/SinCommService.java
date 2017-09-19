package com.oa.deskTop.service;

import java.util.List;

import com.oa.deskTop.entity.SinComm;

public interface SinCommService {
	public List<SinComm> searchAllSinComm(int pageNo,int pageSize,int uId);
	public List<SinComm> searchAllSinComm(int uId);
	public int AddSinComm(SinComm sinComm);
	public int removeSinComm(int commId);
	public List<SinComm> searchAllSinComm(int uId,int typeId);
}
