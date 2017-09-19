package com.oa.personnel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.oa.common.BaseDao;
import com.oa.personnel.dao.FormNoDao;

public class FormNoDaoImpl extends BaseDao implements FormNoDao {
	/**
	 * 查找申请号
	 */
	public int findAppNo() {
		String sql="select appNo from formNo";
		ResultSet rs = super.executeQuery(sql);
		int appNo=0;
		try {
			while(rs.next()){
				appNo=rs.getInt("appNo");
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
		return appNo;
	}
	/**
	 * 查找报销号
	 */
	public int findDisNo() {
		String sql="select disNo from formNo";
		ResultSet rs = super.executeQuery(sql);
		int disNo=0;
		try {
			while(rs.next()){
				disNo=rs.getInt("disNo");
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
		return disNo;
	}
	/**
	 * 查找员工号
	 */
	public int findEmpNo() {
		String sql="select empNo from formNo";
		ResultSet rs = super.executeQuery(sql);
		int empNo=0;
		try {
			while(rs.next()){
				empNo=rs.getInt("empNo");
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
		return empNo;
	}
	/**
	 * 查找报告号
	 */
	public int findReportNo() {
		String sql="select reportNo from formNo";
		ResultSet rs = super.executeQuery(sql);
		int reportNo=0;
		try {
			while(rs.next()){
				reportNo=rs.getInt("reportNo");
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
		return reportNo;
	}
	/**
	 * 更新出差申请号
	 */
	public int updateAppNo(int appNo) {
		String sql="update formNo set appNo=?";
		int ret = super.executeUpdate(sql, appNo);
		return ret;
	}
	/**
	 * 更新报销号
	 */
	public int updateDisNo(int disNo) {
		String sql="update formNo set disNo=?";
		int ret = super.executeUpdate(sql, disNo);
		return ret;
	}
	
	/**
	 * 更新员工号
	 */
	public int updateEmpNo(int empNo) {
		String sql="update formNo set empNo=?";
		int ret = super.executeUpdate(sql, empNo);
		return ret;
	}
	/**
	 * 更新报告号
	 */
	public int updateReportNo(int reportNo) {
		String sql="update formNo set reportNo=?";
		int ret = super.executeUpdate(sql, reportNo);
		return ret;
	}
	
}
