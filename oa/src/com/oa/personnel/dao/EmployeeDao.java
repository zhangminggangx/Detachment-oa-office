package com.oa.personnel.dao;

import java.util.List;

import com.oa.personnel.entity.Employee;

public interface EmployeeDao {
   public List<Employee> findAll(int pageSize,int pageNo);
   public int computePageCount(int pageSize);
   public List<Employee> findAll();
   public int insert(Employee e);
   public int delete(int eId);
   public int delete(String empNo);
   public Employee findById(int eId);
   public Employee findByDeptId(int deptId,String position);
   public Employee findByPosition(String position);
   public Employee findByEmpNo(String empNo);
   public int findMaxEmpId();
   public int updatePic(int empId,String pic);
}
