package com.oa.rightmanagement.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.oa.rightmanagement.daoImpl.FunACLDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleAclDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleDaoImpl;
import com.oa.rightmanagement.daoImpl.ModuleFunDaoImpl;
import com.oa.rightmanagement.entity.Module;
import com.oa.rightmanagement.entity.ModuleAcl;
import com.oa.rightmanagement.entity.ModuleFun;
import com.oa.rightmanagement.service.ModuleAclService;

public class ModuleAclServiceImpl implements ModuleAclService {

	private ModuleDaoImpl moduleDaoImpl = new ModuleDaoImpl();
	private ModuleAclDaoImpl moduleAclDaoImpl = new ModuleAclDaoImpl();
	private ModuleFunDaoImpl moduleFunDaoImpl=new ModuleFunDaoImpl();
    private FunACLDaoImpl funACLDaoImpl=new FunACLDaoImpl();
	public List<ModuleAcl> findByRoleId(int roleId) {
		List<ModuleAcl> moduleAcls = moduleAclDaoImpl.findByRoleId(roleId);
		List<ModuleAcl> newModuleAcls = new ArrayList<ModuleAcl>();
		for (ModuleAcl m : moduleAcls) {
			int modId = m.getModId();
			Module mod = moduleDaoImpl.findById(modId);
			m.setModule(mod);
			newModuleAcls.add(m);
		}

		return newModuleAcls;
	}

	public List<ModuleAcl> findByRoleIdNotExist(int roleId) {
		List<ModuleAcl> moduleAcls = moduleAclDaoImpl
				.findByRoleIdNotExist(roleId);
		List<ModuleAcl> newModuleAcls = new ArrayList<ModuleAcl>();
		for (ModuleAcl m : moduleAcls) {
			int modId = m.getModId();
			Module mod = moduleDaoImpl.findById(modId);
			m.setModule(mod);
			newModuleAcls.add(m);
		}

		return newModuleAcls;
	}

	public int add(List<ModuleAcl> moduleAcls) {
		int add=0;
		for (ModuleAcl moduleAcl : moduleAcls) {
			int moduleId=moduleAcl.getModId();
			List<ModuleFun> moduleFuns=moduleFunDaoImpl.findByModuleId(moduleId);
			int roleId=moduleAcl.getRoleId();
			for (ModuleFun moduleFun : moduleFuns) {
				int funId=moduleFun.getFunId();
				add+=funACLDaoImpl.insert(roleId, funId);
			}
			add+=moduleAclDaoImpl.insert(moduleAcl);
		}
		return add;

	}
}
