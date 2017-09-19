package com.oa.deskTop.dao;

import java.util.List;

import com.oa.deskTop.entity.CommTypes;

public interface CommTypesDao {
	public String findByTypeId(int tId);
	public List<CommTypes> findAll();

}
