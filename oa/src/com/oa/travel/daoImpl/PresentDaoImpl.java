package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.PresentDao;
import com.oa.travel.entity.Present;

public class PresentDaoImpl extends BaseDao implements PresentDao {

	public int computePageCount(int pageSize) {
		return 0;
	}

	public int delete(int inventId,int appId) {
		String a = "delete from present  where inventId=? and appId=?";
		List params=new ArrayList();
		params.add(inventId);
	    params.add(appId);
		int ret  = super.executeUpdate(a,params);
		super.close();
		return ret;
	}
	public List<Present> findAll() {
		return null;
	}

	public List<Present> findAll(int pageSize, int pageNo) {
		return null;
	}

	/*
	 * 当员工出差时领用礼品
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.PresentDao#insert(com.oa.travel.entity.Present)
	 */
	public int insert(Present p) {
		
		String insertSql="insert into present values(?,?)";
		List params=new ArrayList();
		params.add(p.getInventId());
	    params.add(p.getAppId());
		int ret=super.executeUpdate(insertSql, params);
		super.close();
		return ret;
	}

	public List<Present> findByAppId(int AppId) {
		List<Present> list=new ArrayList<Present>();
        String sql="select * from Present where appId=?";
        ResultSet rs=super.executeQuery(sql,AppId);
        Present g=null;
        try {
			while(rs.next())
			{
				g=new Present();
				g.setPreId(rs.getInt("presentId"));
				g.setInventId(rs.getInt("inventId"));
				g.setAppId(rs.getInt("appId"));
			
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	/**
	   * 通过出差申请的id查询---视图关联查询---库存表物品名和礼品
	   */

	public List<Present> findViewPresentInvName(int AppId) {
		List<Present> list=new ArrayList<Present>();
	      String sql="select * from ViewPresentInvName where appid=?";
	      ResultSet rs=super.executeQuery(sql,AppId);
	      Present g=null;
	      try {
				while(rs.next())
				{
					g=new Present();
					g.setPreId(rs.getInt("preId"));
					g.setInventId(rs.getInt("inventId"));
					g.setAppId(rs.getInt("appId"));
					g.setGoodsName(rs.getString("goodsName"));
					g.setPrice(rs.getDouble("price"));
					g.setStore(rs.getInt("store"));
					list.add(g);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					rs.close();super.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return list;
	}
	
	/*很据物品Id和申请单Id查找这个物品的出库数量*/
	public int findCountByInventIdAndAppId(int inventId, int appId) {
		String sql="select COUNT(preId) as count from present where inventId=? and appId=?";
		List params=new ArrayList();
		params.add(inventId);
	    params.add(appId);
		ResultSet rs=super.executeQuery(sql,params);
		int count=-1;
		try {
			if(rs.next())
			{
				count=rs.getInt("count");
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
		return count;
	}

}
