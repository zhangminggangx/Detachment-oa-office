package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.ApproveResult;


public interface ApprovedResultService {
	public List<ApproveResult> findByFormNo(String formNo);
	public int add(ApproveResult ar);
}
