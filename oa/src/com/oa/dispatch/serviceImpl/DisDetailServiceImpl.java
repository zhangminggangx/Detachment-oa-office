package com.oa.dispatch.serviceImpl;

import java.util.List;

import com.oa.dispatch.daoImpl.DisDetailDaoImpl;
import com.oa.dispatch.entity.DisDetail;
import com.oa.dispatch.service.DisDetailService;

public class DisDetailServiceImpl implements DisDetailService {

	private DisDetailDaoImpl detailImpl=new DisDetailDaoImpl();
	public List<DisDetail> searchByDisId(int disId) {
		return detailImpl.findAll(disId);
	}

}
