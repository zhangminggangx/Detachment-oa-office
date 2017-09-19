package com.oa.personnel.dao;

import java.util.List;

import com.oa.personnel.entity.Department;

public interface DepartmentDao {
  public List<Department> findAll();
  public List<Department> findAll(int pageSize,int pageNo);
  public int computePageCount(int pageSize);
  public Department findById(int dId);
  public int delete(int dId);
  public int insert(Department d);
  public int findIdByName(String deptName);
  /**
   * 通过部门名称查找
   */
  Department findByDeptName(String deptName);
}
