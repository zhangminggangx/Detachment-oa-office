package com.oa.dispatch.dao;

import java.util.List;

import com.oa.dispatch.entity.DisDetail;

public interface DisDetailDao {
	public List<DisDetail> findAll(int disId);
	public int insert(DisDetail disDetail);
	public int delete(int disId);
	public int update(DisDetail disDetail);
	
	

}
