package com.oa.rightmanagement.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.oa.rightmanagement.daoImpl.ModuleDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleFunDaoImpl;
import com.oa.rightmanagement.entity.ModuleFun;
import com.oa.rightmanagement.service.ModuleFunService;

public class ModuleFunServiceImpl implements ModuleFunService{

	private ModuleFunDaoImpl moduleFunDaoImpl=new ModuleFunDaoImpl();
    private ModuleDaoImpl moduleDaoImpl=new ModuleDaoImpl();
	public List<ModuleFun> searchByModuleId(int moduleId) {
		List<ModuleFun> moduleFuns=moduleFunDaoImpl.findByModuleId(moduleId);
		List<ModuleFun> newModuleFuns=new ArrayList<ModuleFun>();
		for(ModuleFun mf:moduleFuns)
		{
			int modId=mf.getModId();
			mf.setModule(moduleDaoImpl.findById(modId));
			newModuleFuns.add(mf);
			
		}
		return newModuleFuns;
	}
	/**
	 * Í¨¹ýid
	 */
	public ModuleFun findById(int funId){
		ModuleFun moduleFun=moduleFunDaoImpl.findById(funId);
		return moduleFun;
		
	}

}
