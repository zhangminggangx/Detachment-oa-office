package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.ApproveResultDao;
import com.oa.travel.entity.ApproveResult;

public class ApproveResultImpl extends BaseDao implements ApproveResultDao {

	public int insert(ApproveResult ar) {

		String sql="insert into approveResult values(?,?,?,?,?)";
		List params=new ArrayList();
		params.add(ar.getFormNo());
		params.add(ar.getWsId());
		params.add(ar.getApproveTime());
		params.add(ar.getResultId());
		params.add(ar.getApproveReason());
		return super.executeUpdate(sql, params);
	}

	/*
	 *根据formNo查找结果信息 
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.ApproveResultDao#findByFormNo(java.lang.String)
	 */
	public List<ApproveResult> findByFormNo(String formNo) {
		//String sql="select * from approveResult where formNo=?";
		String sql = "select app.*,resName from approveResult as app join result as  res on app.resultId=res.resId where app.formNo=?";

		List<ApproveResult> list=new ArrayList<ApproveResult>();
		ApproveResult ar=null;
		ResultSet rs=super.executeQuery(sql, formNo);
		try {
			while(rs.next()){
				ar=new ApproveResult();
				ar.setArId(rs.getInt("arId"));
				ar.setFormNo(formNo);
				ar.setApproveTime(rs.getDate("approveTime"));
				ar.setResultId(rs.getInt("resultId"));
				ar.setWsId(rs.getInt("wsId"));
				ar.setApproveReason(rs.getString("approveReason"));
				ar.getResult().setResName(rs.getString("resName"));
				list.add(ar);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			super.close();
		}
		return list;
	}
	/**
	 * 根据WSId查找审核结果
	 */
	public ApproveResult finByWsId(int wsId) {
		//String sql ="select * from approveResult where wsId=?";
		String sql = "select app.*,resName from approveResult as app join result as  res on app.resultId=res.resId where app.wsId=?";

		ResultSet rs = super.executeQuery(sql, wsId);
		ApproveResult appResult=null;
		try {
			while(rs.next()){
				appResult=new ApproveResult();
				appResult.setArId(rs.getInt("arId"));
				appResult.setFormNo(rs.getString("formNo"));
				appResult.setWsId(rs.getInt("wsId"));
				appResult.setApproveTime(rs.getDate("approveTime"));
				appResult.setResultId(rs.getInt("resultId"));
				appResult.setApproveReason(rs.getString("approveReason"));
				appResult.getResult().setResName(rs.getString("resName"));
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
		return appResult;
	}

}
