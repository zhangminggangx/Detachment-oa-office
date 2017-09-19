package com.oa.rightmanagement.dao;

import java.util.List;

import com.oa.rightmanagement.entity.ModuleFun;

public interface ModuleFunDao {

	public ModuleFun findById(int funId);
	public List<ModuleFun> findByModuleId(int moduleId);
	public ModuleFun findByFunCode(String funCode);

}
