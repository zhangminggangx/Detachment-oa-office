package com.oa.dispatch.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.dispatch.dao.DisDetailDao;
import com.oa.dispatch.entity.DisDetail;

public class DisDetailDaoImpl extends BaseDao implements DisDetailDao {
	/**
	 * 删除报销明细
	 */
	public int delete(int disId) {
		int ret=0;
		String sql="delete from disDetail where disId=?";
		ret = super.executeUpdate(sql, disId);
		return ret;
	}
	

	/**
	 * 查找disId的报销明细
	 */
	public List<DisDetail> findAll(int disId) {
		//String sql="select * from disDetail where disId=?";
		String sql = "select d.*,proName from disDetail as d join disProject as  dp on d.proId=dp.proId where d.disId=?";
		List<DisDetail> detailList = new ArrayList<DisDetail>();
		ResultSet rs = super.executeQuery(sql,disId);
		try {
			while(rs.next()){
				DisDetail disDetail = new DisDetail();
				disDetail.setDetailId(rs.getInt("detailId"));
				disDetail.setDisId(rs.getInt("disId"));
				disDetail.setProId(rs.getInt("proId"));
				disDetail.setDetailMoney(rs.getDouble("detailMoney"));
				disDetail.setDescription(rs.getString("description"));
				disDetail.getDisProject().setProName(rs.getString("proName"));
				detailList.add(disDetail);
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
		return detailList;
	}
	/**
	 * 增加报销明细表
	 */
	public int insert(DisDetail disDetail) {
		String sql = "insert into disDetail values(?,?,?,?)";
		int ret=0;
		List params = new ArrayList();
		params.add(disDetail.getDisId());
		params.add(disDetail.getProId());
		params.add(disDetail.getDetailMoney());
		params.add(disDetail.getDescription());
		
		ret=super.executeUpdate(sql,params);
		return ret;
	}
	/**
	 * 修改报销明细
	 */
	public int update(DisDetail disDetail) {
		String sql="update disDetail set detailMoney=?,description=? where detailId=?";
		List params = new ArrayList();
		params.add(disDetail.getDetailMoney());
		params.add(disDetail.getDescription());
		params.add(disDetail.getDetailId());
		return super.executeUpdate(sql, params);
	}


	
}
