package com.oa.deskTop.service;

import java.util.List;

import com.oa.deskTop.entity.Communication;

public interface CommunicationService {
	public List<Communication> serachAll(int pageSize,int pageNo);
	public List<Communication> serachAll();
	public int computPageCount(int pageSize);
	public List<Communication> SearchByCondition(String empName, String department,
			String position, String empMobile);
	public int addCommunication(Communication comm);
	 public int updateComm(Communication comm);
	Communication findById(int commId);
}
