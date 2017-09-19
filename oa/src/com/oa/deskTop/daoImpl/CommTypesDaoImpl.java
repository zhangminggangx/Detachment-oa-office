package com.oa.deskTop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.deskTop.dao.CommTypesDao;
import com.oa.deskTop.entity.CommTypes;

public class CommTypesDaoImpl extends BaseDao implements CommTypesDao {

	public String findByTypeId(int tId) {
		String sql = "select tName from commTypes where tId=?";
		ResultSet rs = super.executeQuery(sql,tId);
		String typeName="";
		try {
			while(rs.next()){
				typeName=rs.getString("tName");
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
		return typeName;
	}
	/**
	 * 查找所有的类型信息
	 */
	public List<CommTypes> findAll() {
		String sql="select * from commTypes ";
		ResultSet rs = super.executeQuery(sql);
		List<CommTypes> ctList = new ArrayList<CommTypes>();
		try {
			while(rs.next()){
				CommTypes commTypes = new CommTypes();
				commTypes.setTid(rs.getInt("tId"));
				commTypes.setTname(rs.getString("tName"));
				ctList.add(commTypes);
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
		return ctList;
	}

}
