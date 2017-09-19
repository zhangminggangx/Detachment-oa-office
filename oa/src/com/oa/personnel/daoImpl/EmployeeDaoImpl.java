package com.oa.personnel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.personnel.dao.EmployeeDao;
import com.oa.personnel.entity.Employee;

public class EmployeeDaoImpl extends BaseDao implements EmployeeDao {

	/**
	 * 根据用户的id删除员工信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.EmployeeDao#delete(int)
	 */
	public int delete(int eId) {
		String sql="delete * from employee where empId=?";		
		return super.executeUpdate(sql,eId);
	}
    /**
     * 查找所有的员工信息
     * (non-Javadoc)
     * @see com.oa.personnel.dao.EmployeeDao#findAll()
     */
	public List<Employee> findAll() {
		List<Employee> list=new ArrayList<Employee>();
		String sql="select  * from employee order by empNo desc";
		Employee e=null;
		ResultSet rs=super.executeQuery(sql);
		try {
			while(rs.next()){
				e=new Employee();
				e.setEmpId(rs.getInt("empId"));
				e.setEmpNo(rs.getString("empNo"));
				e.setCompany(rs.getString("company"));
				e.setDeptName(rs.getString("deptName"));
				e.setDeptId(rs.getInt("deptId"));
				e.setEmpName(rs.getString("empName"));
				e.setEmpBirth(rs.getDate("empBirth"));
				e.setEmpDiploma(rs.getString("empDiploma"));
				e.setEmpExperience(rs.getString("empExperience"));
				e.setEmpMoble(rs.getString("empMoble"));
				e.setEmpEmail(rs.getString("empEmail"));
				e.setIdCard(rs.getString("idCard"));
				e.setPicture(rs.getString("picture"));
				e.setPosition(rs.getString("position"));
				list.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		return list;
	}
	/**
	 * 分页查找员工信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.EmployeeDao#findAll(int, int)
	 */
	public List<Employee> findAll(int pageSize, int pageNo) {
		List<Employee> list=new ArrayList<Employee>();
		String sql="select top "+pageSize+" * from employee where empId not in(select top "+(pageNo-1)*pageSize+" empId from employee order by empNo desc) order by empNo desc";
		Employee e=null;
		ResultSet rs=super.executeQuery(sql);
		try {
			while(rs.next()){
				e=new Employee();
				e.setEmpId(rs.getInt("empId"));
				e.setEmpNo(rs.getString("empNo"));
				e.setCompany(rs.getString("company"));
				e.setDeptName(rs.getString("deptName"));
				e.setDeptId(rs.getInt("deptId"));
				e.setEmpName(rs.getString("empName"));
				e.setEmpBirth(rs.getDate("empBirth"));
				e.setEmpDiploma(rs.getString("empDiploma"));
				e.setEmpExperience(rs.getString("empExperience"));
				e.setEmpMoble(rs.getString("empMoble"));
				e.setEmpEmail(rs.getString("empEmail"));
				e.setIdCard(rs.getString("idCard"));
				e.setPicture(rs.getString("picture"));
				e.setPosition(rs.getString("position"));
				list.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		return list;
	}
	/**
	 * 得到页数
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.EmployeeDao#getMaxPage(int)
	 */
	public int computePageCount(int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select count(empId) as 'total' from employee ";
		ResultSet rs = super.executeQuery(sql);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);方法一
				total=rs.getInt("total");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return (total%pageSize==0?total/pageSize:total/pageSize+1);	
}
	/**
	 * 根据员工id查找用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.EmployeeDao#findById(int)
	 */
	public Employee findById(int eId) {
		String sql="select  * from employee where empId=?";
		Employee e=null;
		ResultSet rs=super.executeQuery(sql,eId);
		try {
			while(rs.next()){
				e=new Employee();
				e.setEmpId(rs.getInt("empId"));
				e.setEmpNo(rs.getString("empNo"));
				e.setCompany(rs.getString("company"));
				e.setDeptName(rs.getString("deptName"));
				e.setDeptId(rs.getInt("deptId"));
				e.setEmpName(rs.getString("empName"));
				e.setEmpBirth(rs.getDate("empBirth"));
				e.setEmpDiploma(rs.getString("empDiploma"));
				e.setEmpExperience(rs.getString("empExperience"));
				e.setEmpMoble(rs.getString("empMoble"));
				e.setEmpEmail(rs.getString("empEmail"));
				e.setIdCard(rs.getString("idCard"));
				e.setPicture(rs.getString("picture"));
				e.setPosition(rs.getString("position"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		return e;
	}
	/**
	 * 插入一条用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.EmployeeDao#insert(com.oa.personnel.entity.Employee)
	 */
	public int insert(Employee e) {
		String sql="insert into employee values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		List params=new ArrayList();
		params.add(e.getEmpNo());
		params.add(e.getEmpName());
		params.add(e.getEmpBirth());
		params.add(e.getIdCard());
		params.add(e.getEmpDiploma());
		params.add(e.getEmpExperience());
		params.add(e.getEmpMoble());
		params.add(e.getEmpEmail());
		params.add(e.getDeptName());
		params.add(e.getDeptId());
		params.add(e.getCompany());
		params.add(e.getPosition());
		params.add(e.getPicture());
		return super.executeUpdate(sql, params);
	}
	/**
	 * 找到当前员工的部门经理
	 * @param deptId
	 * @param position
	 * @return
	 */
	public Employee findByDeptId(int deptId, String position) {
		String sql="select  * from employee where deptId=? and position=?" ;
		List params=new ArrayList();
		params.add(deptId);params.add(position);
		Employee e=null;
		ResultSet rs=super.executeQuery(sql,params);
		try {
			while(rs.next()){
				e=new Employee();
				e.setEmpId(rs.getInt("empId"));
				e.setEmpNo(rs.getString("empNo"));
				e.setCompany(rs.getString("company"));
				e.setDeptName(rs.getString("deptName"));
				e.setDeptId(rs.getInt("deptId"));
				e.setEmpName(rs.getString("empName"));
				e.setEmpBirth(rs.getDate("empBirth"));
				e.setEmpDiploma(rs.getString("empDiploma"));
				e.setEmpExperience(rs.getString("empExperience"));
				e.setEmpMoble(rs.getString("empMoble"));
				e.setEmpEmail(rs.getString("empEmail"));
				e.setIdCard(rs.getString("idCard"));
				e.setPicture(rs.getString("picture"));
				e.setPosition(rs.getString("position"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		return e;
	}
	

	/*
	 * 查找总经理的id
	 */

	public Employee findByPosition(String position){
		String sql="select  * from employee where  position=?" ;
		Employee e=null;
		ResultSet rs=super.executeQuery(sql,position);
		try {
			while(rs.next()){
				e=new Employee();
				e.setEmpId(rs.getInt("empId"));
				e.setEmpNo(rs.getString("empNo"));
				e.setCompany(rs.getString("company"));
				e.setDeptName(rs.getString("deptName"));
				e.setDeptId(rs.getInt("deptId"));
				e.setEmpName(rs.getString("empName"));
				e.setEmpBirth(rs.getDate("empBirth"));
				e.setEmpDiploma(rs.getString("empDiploma"));
				e.setEmpExperience(rs.getString("empExperience"));
				e.setEmpMoble(rs.getString("empMoble"));
				e.setEmpEmail(rs.getString("empEmail"));
				e.setIdCard(rs.getString("idCard"));
				e.setPicture(rs.getString("picture"));
				e.setPosition(rs.getString("position"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		return e;
	}
	
	/**
	 * 查找用户的详细信息
	 */
	public Employee findByEmpNo(String empNo) {
		String sql="select  * from employee where empNo=?";
		Employee e=null;
		ResultSet rs=super.executeQuery(sql,empNo);
		try {
			while(rs.next()){
				e=new Employee();
				e.setEmpId(rs.getInt("empId"));
				e.setEmpNo(rs.getString("empNo"));
				e.setCompany(rs.getString("company"));
				e.setDeptName(rs.getString("deptName"));
				e.setDeptId(rs.getInt("deptId"));
				e.setEmpName(rs.getString("empName"));
				e.setEmpBirth(rs.getDate("empBirth"));
				e.setEmpDiploma(rs.getString("empDiploma"));
				e.setEmpExperience(rs.getString("empExperience"));
				e.setEmpMoble(rs.getString("empMoble"));
				e.setEmpEmail(rs.getString("empEmail"));
				e.setIdCard(rs.getString("idCard"));
				e.setPicture(rs.getString("picture"));
				e.setPosition(rs.getString("position"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		return e;
	}
	public int delete(String empNo) {
		String sql="delete  from employee where empNo=?";		
		return super.executeUpdate(sql,empNo);
	}
	/**
	 * 查找最新插入的员工id
	 */
	public int findMaxEmpId() {
		String sql ="select top 1 empId from employee order by empId desc";
		ResultSet rs =super.executeQuery(sql);
		int empId=0;
		try {
			while(rs.next()){
				empId=rs.getInt("empId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return empId;
	}
	public int updatePic(int empId,String pic){
		String sql="update employee set picture=? where empId="+empId;
		return super.executeUpdate(sql,pic);
	}

}
