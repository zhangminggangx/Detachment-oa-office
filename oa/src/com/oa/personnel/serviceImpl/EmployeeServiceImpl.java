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
	 * ͨ������id����Ա��
	 */
	public Employee searchByDeptId(int deptId, String position) {
		return employeeDaoImpl.findByDeptId(deptId, position);
	}
	public Employee searchByPosition(String position) {
		return employeeDaoImpl.findByPosition(position);
	}
	/**
	 * ��������Ա����Ϣ
	 */
	public List<Employee> searchAllEmployee(int pageSize,int pageNo) {
		List<Employee> empList = employeeDaoImpl.findAll(pageSize, pageNo);
		return empList;
	}
	/**
	 * ����ҳ��
	 */
	public int computerPageCount(int pageSize) {
		return employeeDaoImpl.computePageCount(pageSize);
	}
	/**
	 * ����Ա����ϸ��Ϣ
	 */
	public Employee searchEmployeeDetail(String empNo) {
		return employeeDaoImpl.findByEmpNo(empNo);
	}
	
	/**
	 * ɾ��Ա��
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
	 * ���Ա��
	 */
	public int addEmployee(Employee employee) {
		return employeeDaoImpl.insert(employee);
	}
	/**
	 * �������²����Ա��id
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
