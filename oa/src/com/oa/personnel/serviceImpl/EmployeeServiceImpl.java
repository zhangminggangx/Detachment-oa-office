package com.oa.personnel.serviceImpl;

import java.util.List;

import com.oa.personnel.dao.UserInfoDao;
import com.oa.personnel.daoImpl.EmployeeDaoImpl;
import com.oa.personnel.daoImpl.UserInfoDaoImpl;
import com.oa.personnel.entity.Employee;
import com.oa.personnel.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService{
	private EmployeeDaoImpl employeeDaoImpl=new EmployeeDaoImpl();
	private UserInfoDao userDaoImpl = new UserInfoDaoImpl();
	
	public Employee SearchById(int eId) {
		Employee employee=employeeDaoImpl.findById(eId);
		return employee;
	}
	/**
	 * 通过部门id查找员工
	 */
	public Employee searchByDeptId(int deptId, String position) {
		return employeeDaoImpl.findByDeptId(deptId, position);
	}
	public Employee searchByPosition(String position) {
		return employeeDaoImpl.findByPosition(position);
	}
	/**
	 * 查找所有员工信息
	 */
	public List<Employee> searchAllEmployee(int pageSize,int pageNo) {
		List<Employee> empList = employeeDaoImpl.findAll(pageSize, pageNo);
		return empList;
	}
	/**
	 * 计算页数
	 */
	public int computerPageCount(int pageSize) {
		return employeeDaoImpl.computePageCount(pageSize);
	}
	/**
	 * 查找员工详细信息
	 */
	public Employee searchEmployeeDetail(String empNo) {
		return employeeDaoImpl.findByEmpNo(empNo);
	}
	
	/**
	 * 删除员工
	 */
	public int removeEmployee(String empNo) {
		int ret1= employeeDaoImpl.delete(empNo);
		if(ret1==1){
			int ret2 = userDaoImpl.delete(empNo);
			return ret1+ret2;
		}
		return ret1;
	}
	/**
	 * 添加员工
	 */
	public int addEmployee(Employee employee) {
		return employeeDaoImpl.insert(employee);
	}
	/**
	 * 查找最新插入的员工id
	 */
	public int searchNewAddEmpId() {
		return employeeDaoImpl.findMaxEmpId();
	}
	public List<Employee> searchAllEmployee() {
		List<Employee> empList = employeeDaoImpl.findAll();
		return empList;
	}
	public int updatePic(int empId,String pic){
		  return employeeDaoImpl.updatePic(empId,pic);
	}

}
