package com.oa.personnel.service;

import java.util.List;

import com.oa.personnel.entity.Employee;

public interface EmployeeService {

	/**
	 * Í¨¹ýid²éÕÒ
	 */
	public Employee SearchById(int eId);

	public Employee searchByDeptId(int deptId, String position);

	public Employee searchByPosition(String position);

	public List<Employee> searchAllEmployee(int pageSize, int pageNo);
	
	public List<Employee> searchAllEmployee();

	public int computerPageCount(int pageSize);
	
	public Employee searchEmployeeDetail(String empNo);
	
	public int removeEmployee(String empNo);
	
	public int addEmployee(Employee employee);
	
	public int searchNewAddEmpId();
	public int updatePic(int empId,String pic);

}
