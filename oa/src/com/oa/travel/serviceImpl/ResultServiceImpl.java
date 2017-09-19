package com.oa.travel.serviceImpl;

import java.util.List;

import com.oa.travel.daoImpl.ResultDaoImpl;
import com.oa.travel.entity.Result;
import com.oa.travel.service.ResultService;

public class ResultServiceImpl implements ResultService{

	private ResultDaoImpl impl=new ResultDaoImpl();
	public Result findById(int rsId){
		return impl.findById(rsId);
		}
	public List<Result> queryAll() {
		return impl.findAll();
	}

	
}
