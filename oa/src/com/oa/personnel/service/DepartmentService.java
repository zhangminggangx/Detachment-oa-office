package com.oa.personnel.service;

import java.util.List;

import com.oa.personnel.entity.Department;

public interface DepartmentService {
	public List<Department> searchAll();
	public int searchDeptId(String deptName);
	 /**
	   * ͨ���������Ʋ���
	   */
	  Department findByDeptName(String deptName);
}
