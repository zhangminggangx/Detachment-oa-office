package com.oa.travel.serviceImpl;

import java.util.List;

import com.oa.travel.daoImpl.ApproveResultImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.service.ApprovedResultService;

public class ApprovedResultServiceImpl implements ApprovedResultService {
	private ApproveResultImpl impl=new ApproveResultImpl();
	public List<ApproveResult> findByFormNo(String formNo){
	  return impl.findByFormNo(formNo);	
	}
	public int add(ApproveResult ar){
		return impl.insert(ar);
	}
}
