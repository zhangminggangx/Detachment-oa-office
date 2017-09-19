package com.oa.rightmanagement.serviceImpl;

import com.oa.rightmanagement.daoImpl.ModuleAclDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleDaoImpl;
import com.oa.rightmanagement.entity.Module;

public class ModuleServiceImpl {
	private ModuleDaoImpl moduleDaoImpl=new ModuleDaoImpl();
	public Module findById(int modId){
		Module module=	moduleDaoImpl.findById(modId);
		return module;
	}
}
