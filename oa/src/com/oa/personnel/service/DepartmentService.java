package com.oa.personnel.service;

import java.util.List;

import com.oa.personnel.entity.Department;

public interface DepartmentService {
	public List<Department> searchAll();
	public int searchDeptId(String deptName);
	 /**
	   * 通过部门名称查找
	   */
	  Department findByDeptName(String deptName);
}
