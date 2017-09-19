package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.ResultDao;
import com.oa.travel.entity.Result;

public class ResultDaoImpl extends BaseDao implements ResultDao {

	public int delete(int rId) {
		String sql="delete * from result where resId=?";
		
		return super.executeUpdate(sql);
	}

	public List<Result> findAll() {
		String sql="select * from result";
		List<Result> list=new ArrayList<Result>();
		Result r=null;
		ResultSet rs=super.executeQuery(sql);
		try {
			while(rs.next()){
				r=new Result();
				r.setResId(rs.getInt("resId"));
				r.setResName(rs.getString("resName"));
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			super.close();
		}
		
		return list;
	}

	public Result findById(int id) {
		String sql="select * from result where resId=?";
		Result r=null;
		ResultSet rs=super.executeQuery(sql,id);
		try {
			while(rs.next()){
				r=new Result();
				r.setResId(rs.getInt("resId"));
				r.setResName(rs.getString("resName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			super.close();
		}
		
		return r;
	}

	public int insert(Result r) {
		String sql="insert into result values(?)";
		return super.executeUpdate(sql, r.getResName());
	}
    
}
