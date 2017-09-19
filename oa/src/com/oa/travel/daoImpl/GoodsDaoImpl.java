package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.GoodsDao;
import com.oa.travel.entity.Goods;

public class GoodsDaoImpl extends BaseDao implements GoodsDao {

	/*����idɾ��goods��Ϣ
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#delete(int)
	 */
	public int delete(int id) {
	    String sql="delete from goods where goodsId=?";
		return super.executeUpdate(sql, id);
	}
	/*
	 * ��ѯ���е�goods��Ϣ
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#findAll()
	 */
	public List<Goods> findAll() {
		List<Goods> list=new ArrayList<Goods>();
        String sql="select * from goods";
        ResultSet rs=super.executeQuery(sql);
        Goods g=null;
        try {
			while(rs.next())
			{
				g=new Goods();
				g.setGoodsId(rs.getInt("goodsId"));
				g.setInventId(rs.getInt("inventId"));
				g.setAppId(rs.getInt("appId"));
				g.setHasReturn(rs.getBoolean("hasReturn"));
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

	/*
	 * ��ҳ��ѯ���е�goods��Ϣ
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#findAll(int, int)
	 */
	public List<Goods> findAll(int pageSize, int pageNo) {
		List<Goods> list=new ArrayList<Goods>();
		String sql="select top "+pageSize+" * from goods where goodsId not in(select top"+(pageNo-1)*pageSize+" goodsId from goods)";
        ResultSet rs=super.executeQuery(sql);
        Goods g=null;
        try {
			while(rs.next())
			{
				g=new Goods();
				g.setGoodsId(rs.getInt("goodsId"));
				g.setInventId(rs.getInt("inventId"));
				g.setAppId(rs.getInt("appId"));
				g.setHasReturn(rs.getBoolean("hasReturn"));
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

	/*
	 * �õ����ҳ��
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#computePageCount(int)
	 */
	public int computePageCount(int pageSize) {
		String sql = "select count(goodsId) as 'total' from goods ";
		ResultSet rs = super.executeQuery(sql);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);����һ
				total=rs.getInt("total");
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
		return (total%pageSize==0?total/pageSize:total/pageSize+1);	
	}

	/*
	 * ��Ա��Ҫ����ʱ��Ҫ��goods���в�������
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#insert(com.oa.travel.entity.Goods)
	 */
	public int insert(Goods g) {
		String sql="insert into goods values(?,?,?)";
		String updateSql="update inventory set store=store-1 where inventId="+g.getInventId();
		List params=new ArrayList();
		params.add(g.getInventId());
		params.add(g.getAppId());
		params.add(g.getHasReturn());
		if(super.executeUpdate(sql, params)!=0&&super.executeUpdate(updateSql)!=0)
		    return 1;
		return 0;
	}

	/*
	 * ���������ʱ��Ҫ����Ʒ�黹����ʱʵ�ָ���
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#updateHasReturn(int, int)
	 */
	public int updateHasReturn(int inventId, int goodsId) {
		String sql1="update goods set hasReturn='true' where goodsId="+goodsId;
		String sql2="update inventory set store=store+1 where inventId="+inventId;
		if(super.executeUpdate(sql1)!=0&&super.executeUpdate(sql2)!=0){
		  return 1;}else{
		return 0;}
	}
	
	/** 
	 * ͨ�����id�͹����ĳ��������ѯΨһ����Ʒ��Ϣ
	 */
	public Goods findByInvIdAndAppId(int invId, int appId) {
		
		String sql = "select * from goods where inventId=? and appId=?";
		List params=new ArrayList();
		params.add(invId);
		params.add(appId);
		ResultSet rs = super.executeQuery(sql, params);
		Goods goods = null;
		try {
			if (rs.next()) {
				goods = new Goods();
				goods.setInventId(invId);
				goods.setAppId(appId);
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setHasReturn(rs.getBoolean("hasReturn"));
		        
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
		return goods;
	}
	/**
	 * ͨ����������id��ѯ��Ʒ
	 */
	public List<Goods> findByAppId(int AppId) {
		List<Goods> list=new ArrayList<Goods>();
        String sql="select * from ViewGoodsInvName where appId=?";
        ResultSet rs=super.executeQuery(sql,AppId);
        Goods g=null;
        try {
			while(rs.next())
			{
				g=new Goods();
				g.setGoodsName(rs.getString("goodsName"));
				g.setGoodsId(rs.getInt("goodsId"));
				g.setInventId(rs.getInt("inventId"));
				g.setAppId(rs.getInt("appId"));
				g.setHasReturn(rs.getBoolean("hasReturn"));
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
	   * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ������Ʒ
	   */
	public List<Goods> findViewGoodsInvName(int AppId) {
		List<Goods> list=new ArrayList<Goods>();
        String sql="select * from ViewGoodsInvName where appid=?";
        ResultSet rs=super.executeQuery(sql,AppId);
        Goods g=null;
        try {
			while(rs.next())
			{
				g=new Goods();
				g.setGoodsId(rs.getInt("goodsId"));
				g.setInventId(rs.getInt("inventId"));
				g.setAppId(rs.getInt("appId"));
				g.setHasReturn(rs.getBoolean("hasReturn"));
				g.setGoodsName(rs.getString("goodsName"));
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
	 * ͨ���������뵥idɾ��
	 */
	public int deleteByAppId(int appId) {
		 String sql="delete from goods where appId=?";
			 int ret=super.executeUpdate(sql, appId);
			 return ret;
	}
	/**
	 * �޸Ĳ���ʱ�����޸���Ʒ���ز���
	 */
	public int updateReturnFalse(int inventId, int goodsId) {
		String sql1="update goods set hasReturn='false' where goodsId="+goodsId;
		String sql2="update inventory set store=store-1 where inventId="+inventId;
		if(super.executeUpdate(sql1)!=0&&super.executeUpdate(sql2)!=0){
		  return 1;}else{
		return 0;}
	}
	
	/*
	 * ��Ա��Ҫ����ʱ��Ҫ��goods���в�������(С����)
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#insert(com.oa.travel.entity.Goods)
	 */

		public int insert2(Goods g) {	
			String sql="insert into goods values(?,?,?)";
			List params=new ArrayList();
			params.add(g.getInventId());
		    params.add(g.getAppId());
			params.add(g.getHasReturn());
			int ret=super.executeUpdate(sql, params);
			super.close();
			return ret;
	}
		
		/**
		 * ��ѯ��������δ�黹����Ʒ
		 */
		public List<Goods> findUnReturnByAppId(int AppId) {
			List<Goods> list=new ArrayList<Goods>();
	        String sql="select * from ViewGoodsInvName where appId=? and hasReturn='false'";
	        ResultSet rs=super.executeQuery(sql,AppId);
	        Goods g=null;
	        try {
				while(rs.next())
				{
					g=new Goods();
					g.setGoodsName(rs.getString("goodsName"));
					g.setGoodsId(rs.getInt("goodsId"));
					g.setInventId(rs.getInt("inventId"));
					g.setAppId(rs.getInt("appId"));
					g.setHasReturn(rs.getBoolean("hasReturn"));
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

	

}
