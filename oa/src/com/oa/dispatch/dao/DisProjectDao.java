package com.oa.dispatch.dao;

import java.util.List;

import com.oa.dispatch.entity.DisProject;

public interface DisProjectDao {
	public String findByProId(int proId);
	 public List<DisProject> findAll();
	 public DisProject findById(int proId);


}
