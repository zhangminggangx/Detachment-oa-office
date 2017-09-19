package com.oa.rightmanagement.service;

import java.util.List;

import com.oa.rightmanagement.entity.ModuleFun;

public interface ModuleFunService {
	public List<ModuleFun> searchByModuleId(int moduleId);
	public ModuleFun findById(int funId);
}
