package com.oa.deskTop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.deskTop.dao.SinCommDao;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.entity.SinComm;

public class SinCommDaoImpl extends BaseDao implements SinCommDao {
	/**
	 * 删除个人通讯录
	 */
	public int delete(int commId) {
		int ret =0;
		String sql="delete from sinComm where commId=?";
		ret = super.executeUpdate(sql, commId);
		return ret;
	}
	

	public List<SinComm> findAll(int pageNo, int pageSize, int uId) {
		String sql = "select top "+ pageSize+" comm.*,tName from sinComm as comm join commTypes as ct on comm.tId=ct.tId  where uid=? and comm.commId not in(select top "+ ((pageNo-1)*pageSize) +" comm.commId from sinComm as comm join commTypes as ct on comm.tId=ct.tId )";
		ResultSet rs = super.executeQuery(sql, uId);
		List<SinComm> sinCommList =  new ArrayList<SinComm>();
		try {
			while(rs.next()){
				SinComm sinComm = new SinComm();
				sinComm.setCommId(rs.getInt("commId"));
				sinComm.setSinId(rs.getInt("sinId"));
				sinComm.setTid(rs.getInt("tId"));
				sinComm.setUid(rs.getInt("uId"));
				sinComm.getCommTypes().setTname(rs.getString("tName"));
				sinCommList.add(sinComm);
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
		return sinCommList;
	}

	public List<SinComm> findByTypeId(int uId, int tId) {
		String sql = "select comm.*,tName from sinComm as comm join commTypes as ct on comm.tId=ct.tId  where uid=? and comm.tId=?";
		
		List params = new ArrayList();
		params.add(uId);
		params.add(tId);
		ResultSet rs = super.executeQuery(sql, params);
		List<SinComm> sinCommList =  new ArrayList<SinComm>();
		try {
			while(rs.next()){
				SinComm sinComm = new SinComm();
				sinComm.setCommId(rs.getInt("commId"));
				sinComm.setSinId(rs.getInt("sinId"));
				sinComm.setTid(rs.getInt("tId"));
				sinComm.setUid(rs.getInt("uId"));
				sinComm.getCommTypes().setTname(rs.getString("tName"));
				sinCommList.add(sinComm);
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
		return sinCommList;
	}

	public List<SinComm> findByTypeId(int pageNo, int pageSize, int uId,
			int tId) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 增加个人通讯录的信息
	 */
	public int insert(SinComm comm) {
		int ret =0;
		String sql="insert into sinComm values(?,?,?)";
		List params = new ArrayList();
		params.add(comm.getTid());
		params.add(comm.getUid());
		params.add(comm.getCommId());
		ret = super.executeUpdate(sql, params);
		return ret;
	}


	public List<SinComm> findAll(int uId) {
		String sql = "select  comm.*,tName from sinComm as comm join commTypes as ct on comm.tId=ct.tId  where uid=? ";
		ResultSet rs = super.executeQuery(sql, uId);
		List<SinComm> sinCommList =  new ArrayList<SinComm>();
		try {
			while(rs.next()){
				SinComm sinComm = new SinComm();
				sinComm.setCommId(rs.getInt("commId"));
				sinComm.setSinId(rs.getInt("sinId"));
				sinComm.setTid(rs.getInt("tId"));
				sinComm.setUid(rs.getInt("uId"));
				sinComm.getCommTypes().setTname(rs.getString("tName"));
				sinCommList.add(sinComm);
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
		return sinCommList;
	}





}
