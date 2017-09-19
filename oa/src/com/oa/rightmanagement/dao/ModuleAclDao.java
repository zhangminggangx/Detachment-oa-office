package com.oa.rightmanagement.dao;

import java.util.List;

import com.oa.rightmanagement.entity.ModuleAcl;

public interface ModuleAclDao {
  public List<ModuleAcl> findByRoleId(int roleId);
  public List<ModuleAcl> findByRoleIdNotExist(int roleId);
  public int insert(ModuleAcl moduleAcl);
  public int delete(int roleId);
}
