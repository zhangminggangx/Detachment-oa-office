package com.oa.dispatch.serviceImpl;

import com.oa.dispatch.daoImpl.DisProjectDaoImpl;
import com.oa.dispatch.entity.DisProject;
import com.oa.dispatch.service.DisProjectService;

public class DisProjectServiceImpl implements DisProjectService {

	private DisProjectDaoImpl proImpl=new DisProjectDaoImpl();
	public DisProject searchById(int proId) {
		return proImpl.findById(proId);
	}

}
