package com.oa.deskTop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.oa.common.BaseDao;
import com.oa.deskTop.dao.CommunicationDao;
import com.oa.deskTop.entity.Communication;

public class CommunicationDaoImpl extends BaseDao implements CommunicationDao {
	/**
	 * 查找所有的通讯录
	 */
	public List<Communication> findAll() {
		String sql = "select  comm.*,tName from communication as comm join commTypes as ct on comm.tId=ct.tId  order by comm.createTime desc";
		List<Communication> commList = new ArrayList<Communication>();
		ResultSet rs = super.executeQuery(sql);
		try {
			while(rs.next()){
				Communication comm = new Communication();
				comm.setCommId(rs.getInt("commId"));
				comm.setCreateTime(rs.getDate("createTime"));
				comm.setEmpName(rs.getString("empName"));
				comm.setEmpMobile(rs.getString("empMobile"));
				comm.setPosition(rs.getString("position"));
				comm.setEmail(rs.getString("email"));
				comm.setDepartment(rs.getString("department"));
				comm.setTid(rs.getInt("tId"));
				comm.getCommTypes().setTname(rs.getString("tName"));
				commList.add(comm);
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
		return commList;
	}
	/**
	 * 分页查找所有的通讯录
	 */
	public List<Communication> findAll(int pageNo,int pageSize) {
		String sql = "select top "+ pageSize+" comm.*,tName from communication as comm join commTypes as ct on comm.tId=ct.tId  where comm.commId not in(select top "+ ((pageNo-1)*pageSize) +" comm.commId from communication as comm join commTypes as ct on comm.tId=ct.tId order by comm.createTime desc) order by comm.createTime desc;";
		List<Communication> commList = new ArrayList<Communication>();
		ResultSet rs = super.executeQuery(sql);
		try {
			while(rs.next()){
				Communication comm = new Communication();
				comm.setCommId(rs.getInt("commId"));
				comm.setCreateTime(rs.getDate("createTime"));
				comm.setEmpName(rs.getString("empName"));
				comm.setEmpMobile(rs.getString("empMobile"));
				comm.setPosition(rs.getString("position"));
				comm.setEmail(rs.getString("email"));
				comm.setDepartment(rs.getString("department"));
				comm.setTid(rs.getInt("tId"));
				comm.getCommTypes().setTname(rs.getString("tName"));
				commList.add(comm);
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
		return commList;
	}
	/**
	 * 计算最大页数
	 */
	public int computePageCount(int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select count(commId) as 'total' from communication ";
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
	 * 增加通讯录
	 */
	public int insert(Communication comm) {
		String sql = "insert into communication values(?,?,?,?,?,?,?)";
		List params = new ArrayList();
		params.add(comm.getCreateTime());
		params.add(comm.getEmpName());
		params.add(comm.getEmpMobile());
		params.add(comm.getPosition());
		params.add(comm.getEmail());
		params.add(comm.getDepartment());
		params.add(comm.getTid());
		int ret =0;
		ret=super.executeUpdate(sql, params);
		return ret;
	}
	/**
	 * 删除通讯录
	 */
	public int delete(int commId) {
		int ret=0;
		String sql="delete from communication where commId=?";
		ret = super.executeUpdate(sql, commId);
		return ret;
	}
	/**
	 * 根据不同条件查询通讯录信息
	 */
	public List<Communication> findByCondition(String empName, String department,
			String position, String empMobile) {
		String sql="select comm.*,tName from communication as comm join commTypes as ct on comm.tId=ct.tId  where empName like ? and  department like ?  and position like ? and empMobile like ?";
		List params = new ArrayList();
		if(empName==""){
			params.add("%");
		}else{
			params.add(empName);
		}
		if(department==""){
			params.add("%");
		}else{
			params.add(department);
		}
		if(position==""){
			params.add("%");
		}else{
			params.add(position);
		}
		if(empMobile==""){
			params.add("%");
		}else{
			params.add(empMobile);
		}
		ResultSet rs = super.executeQuery(sql, params);
		List<Communication> commList = new ArrayList<Communication>();
		try {
			while(rs.next()){
				Communication comm = new Communication();
				comm.setCommId(rs.getInt("commId"));
				comm.setCreateTime(rs.getDate("createTime"));
				comm.setEmpName(rs.getString("empName"));
				comm.setEmpMobile(rs.getString("empMobile"));
				comm.setPosition(rs.getString("position"));
				comm.setEmail(rs.getString("email"));
				comm.setDepartment(rs.getString("department"));
				comm.setTid(rs.getInt("tId"));
				comm.getCommTypes().setTname(rs.getString("tName"));
				commList.add(comm);
				
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
		return commList;
	}
	
	/**
	 * 根据CommId查找通讯录信息
	 */
	public Communication findByCommId(int commId) {
		String sql = "select * from communication where commId=?";
		ResultSet rs = super.executeQuery(sql, commId);
		Communication comm = null;
		try {
			while(rs.next()){
				comm=new Communication();
				comm.setCommId(rs.getInt("commId"));
				comm.setCreateTime(rs.getDate("createTime"));
				comm.setDepartment(rs.getString("department"));
				comm.setEmail(rs.getString("email"));
				comm.setEmpMobile(rs.getString("empMobile"));
				comm.setEmpName(rs.getString("empName"));
				comm.setPosition(rs.getString("position"));
				comm.setTid(rs.getInt("tId"));
				
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
		return comm;
	}
	 public int updateComm(Communication comm){
			
			String sql="update communication set empMobile=?, email=?, position=?, department=? where commId=?";
			List params=new ArrayList();
			
			params.add(comm.getEmpMobile());
			params.add(comm.getEmail());
			params.add(comm.getPosition());
			params.add(comm.getDepartment());
			params.add(comm.getCommId());
			return super.executeUpdate(sql,params);
		}


}
