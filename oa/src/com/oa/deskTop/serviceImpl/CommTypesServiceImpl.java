package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.dao.CommTypesDao;
import com.oa.deskTop.dao.SinCommDao;
import com.oa.deskTop.daoImpl.CommTypesDaoImpl;
import com.oa.deskTop.daoImpl.SinCommDaoImpl;
import com.oa.deskTop.entity.CommTypes;
import com.oa.deskTop.service.CommTypesService;

public class CommTypesServiceImpl implements CommTypesService {
	private CommTypesDao commTypeDao = new CommTypesDaoImpl();
	private SinCommDao sinCommDao = new SinCommDaoImpl();
	/**
	 * 查找所有类型信息
	 */
	public List<CommTypes> searchAll() {
		return commTypeDao.findAll();
	}


}
