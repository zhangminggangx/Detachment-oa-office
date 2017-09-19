package com.oa.personnel.serviceImpl;

import java.util.List;

import com.oa.personnel.dao.DepartmentDao;
import com.oa.personnel.daoImpl.DepartmentDaoImpl;
import com.oa.personnel.entity.Department;
import com.oa.personnel.service.DepartmentService;

public class DepartmentServiceImpl implements DepartmentService {
	private DepartmentDao deptDao = new DepartmentDaoImpl();
	public List<Department> searchAll() {
		return deptDao.findAll();
	}
	public int searchDeptId(String deptName) {
		return deptDao.findIdByName(deptName);
	}
	public Department findByDeptName(String deptName) {
		Department department=deptDao.findByDeptName(deptName);
		return department;
	}

}
