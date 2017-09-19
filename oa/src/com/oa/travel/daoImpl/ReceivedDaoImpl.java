package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.ReceivedDao;
import com.oa.travel.entity.Received;

public class ReceivedDaoImpl extends BaseDao implements ReceivedDao {

	public int computePageCount(int pageSize) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Received> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Received> findAll(int pageSize, int pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * 出差回来进行出差报告时，将受赠礼品信息加入这个表中 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.ReceivedDao#insert(com.oa.travel.entity.Received)
	 */
	public int insert(Received r) {
		String insertSql = "insert into received values(?,?,?,?)";
		List params = new ArrayList();
		params.add(r.getRecName());
		params.add(r.getReccount());
		params.add(r.getReportId());
		params.add(r.getHasPut());
		int ret = super.executeUpdate(insertSql, params);
		return ret;
	}

	/*
	 * 将受赠礼品入库 (non-Javadoc)
	 * 
	 * @see
	 * com.oa.travel.dao.ReceivedDao#updateHasPut(com.oa.travel.entity.Received)
	 */
	public int updateHasPut(Received r,int reportId) {
		String updateSql = "update received set hasPut='true' where reportId="+reportId;
		String insertSql = "insert into inventory values(?,?,?,?)";
		List params = new ArrayList();
		params.add(r.getRecName());
		params.add(r.getReccount());
		params.add(99.9);
		params.add("礼品");
		if (super.executeUpdate(updateSql) != 0
				&& super.executeUpdate(insertSql, params) != 0)
			return 1;
		return 0;

	}

	/**
	 * 通过出差报告id查询回赠
	 */
	public Received findByReportId(int reportId) {
		String sql = "select * from received where reportId=?";
		List params=new ArrayList();
		params.add(reportId);
		ResultSet rs = super.executeQuery(sql, params);
		Received received = null;
		try {
			if (rs.next()) {
				received = new Received();
			    received.setHasPut(rs.getBoolean("hasPut"));
			    received.setReccount(rs.getInt("reccount"));
			    received.setRecId(rs.getInt("recId"));
			    received.setRecName(rs.getString("recName"));
			    received.setReportId(reportId);
		        
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return received;
	}

	/**
	 * 修改回赠礼品信息
	 */
	public int update(int receivedId,Received newReceivd) {
		String updateSql = "update received set recName=?,reccount=? where recId=?";
		List params = new ArrayList();
		params.add(newReceivd.getRecName());
		params.add(newReceivd.getReccount());
		params.add(receivedId);
		int ret=super.executeUpdate(updateSql, params);
		return ret;
	     
	}

}
