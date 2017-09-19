package com.oa.rightmanagement.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.oa.rightmanagement.daoImpl.FunACLDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleFunDaoImpl;
import com.oa.rightmanagement.entity.FunACL;
import com.oa.rightmanagement.entity.Module;
import com.oa.rightmanagement.entity.ModuleFun;
import com.oa.rightmanagement.service.FunACLService;

public class FunACLServiceImpl implements FunACLService {

	private FunACLDaoImpl funACLDaoImpl=new FunACLDaoImpl();
	private ModuleFunDaoImpl moduleFunDaoImpl=new ModuleFunDaoImpl();
	private ModuleDaoImpl moduleDaoImpl=new ModuleDaoImpl();
	public List<FunACL> searchByRoleId(int roleId) {
		List<FunACL> funACLs=funACLDaoImpl.findByRoleId(roleId);
		
		List<FunACL> newFunACLs=new  ArrayList<FunACL>();
		for(FunACL fa:funACLs)
		{
			int funId=fa.getFunId();
			ModuleFun moduleFun=moduleFunDaoImpl.findById(funId);
			int moduleId=moduleFun.getModId();
			Module module=moduleDaoImpl.findById(moduleId);
			moduleFun.setModule(module);
			fa.setModuleFun(moduleFun);
			newFunACLs.add(fa);
		}
		return newFunACLs;
	}
	
	/**
	 * 判断是否有权限
	 */
	public boolean hasPermission(String fcode, int roleId) {
		ModuleFun moduleFun = moduleFunDaoImpl.findByFunCode(fcode);
		int fId = moduleFun.getFunId();
		List<FunACL> funList = funACLDaoImpl.findByRoleId(roleId);
		for (FunACL funACL : funList) {
			if(fId==funACL.getFunId()){
				return true;
			}
		}
		return false;
	}

	/**
	 * 添加
	 */
	public int add(int roleId, int funId) {
		int ret=funACLDaoImpl.insert(roleId, funId);
		return ret;
	}
}
