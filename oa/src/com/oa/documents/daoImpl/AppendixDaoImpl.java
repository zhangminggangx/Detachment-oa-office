package com.oa.documents.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.documents.dao.AppendixDao;
import com.oa.documents.entity.Appendix;

public class AppendixDaoImpl extends BaseDao implements AppendixDao {
	/**
	 * ɾ������
	 */
	public int delete(int docId) {
		String sql = "delete from appendix where docId=?";
		return super.executeUpdate(sql, docId);
	}

	/**
	 * ����docId���Ҹ���
	 */
	public List<Appendix> findByDocId(int docId) {
		String sql = "select * from appendix where docId=?";
		List<Appendix> appList = new ArrayList<Appendix>();
		ResultSet rs = super.executeQuery(sql, docId);
		try {
			while (rs.next()) {
				Appendix appendix = new Appendix();
				appendix.setAppendId(rs.getInt("appendId"));
				appendix.setFname(rs.getString("fName"));
				appendix.setDocId(rs.getInt("docId"));
				appendix.setCapacity(rs.getLong("capacity"));
				appList.add(appendix);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return appList;
	}

	/**
	 * ���Ӹ���
	 */
	public int insert(Appendix appendix) {
		String sql = "insert into appendix values(?,?,?)";
		List params = new ArrayList();
		params.add(appendix.getFname());
		params.add(appendix.getDocId());
		params.add(appendix.getCapacity());
		int ret = 0;
		ret = super.executeUpdate(sql, params);
		return ret;
	}

	public Appendix findById(int appendId) {
		String sql = "select * from appendix where appendId=?";
		ResultSet rs = super.executeQuery(sql, appendId);
		Appendix appendix = null;
		try {
			while (rs.next()) {
				appendix = new Appendix();
				appendix.setAppendId(rs.getInt("appendId"));
				appendix.setFname(rs.getString("fName"));
				appendix.setDocId(rs.getInt("docId"));
				appendix.setCapacity(rs.getLong("capacity"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return appendix;
	}

}
