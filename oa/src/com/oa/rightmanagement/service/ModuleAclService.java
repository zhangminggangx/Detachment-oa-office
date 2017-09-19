package com.oa.rightmanagement.service;

import java.util.List;

import com.oa.rightmanagement.entity.ModuleAcl;

public interface ModuleAclService {
   public List<ModuleAcl> findByRoleId(int roleId);
   public List<ModuleAcl> findByRoleIdNotExist(int roleId);
   public int add(List<ModuleAcl> moduleAcls);
}
