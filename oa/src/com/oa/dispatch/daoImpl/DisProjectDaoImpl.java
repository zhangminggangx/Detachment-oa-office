package com.oa.dispatch.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.dispatch.dao.DisProjectDao;
import com.oa.dispatch.entity.DisProject;

public class DisProjectDaoImpl extends BaseDao implements DisProjectDao {
	/**
	 * 根据类型id查找对应的类型名称
	 */
	public String findByProId(int proId) {
		String sql="select proName from disProject where proId=?";
		ResultSet rs = super.executeQuery(sql,proId);
		String proName ="";
		try {
			while(rs.next()){
				proName=rs.getString("proName");
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
		return proName;
	}
	
	/**
	 * 查找所有项目的名称列表
	 */
	public List<DisProject> findAll() {
		List<DisProject> list=new ArrayList<DisProject>();
		String sql="select *  from disProject";
		ResultSet rs = super.executeQuery(sql);
		DisProject p=null;
		try {
			while(rs.next()){
				p=new DisProject();
				p.setProId(rs.getInt("proId"));
				p.setProName(rs.getString("proName"));
				list.add(p);
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
		return list;
	}

	public DisProject findById(int proId) {
		String sql="select *  from disProject where proId=?";
		ResultSet rs = super.executeQuery(sql,proId);
		DisProject p=null;
		try {
			while(rs.next()){
				p=new DisProject();
				p.setProId(rs.getInt("proId"));
				p.setProName(rs.getString("proName"));
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
		return p;
	}

}
