package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.GoodsDao;
import com.oa.travel.entity.Goods;

public class GoodsDaoImpl extends BaseDao implements GoodsDao {

	/*根据id删除goods信息
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#delete(int)
	 */
	public int delete(int id) {
	    String sql="delete from goods where goodsId=?";
		return super.executeUpdate(sql, id);
	}
	/*
	 * 查询所有的goods信息
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
	 * 分页查询所有的goods信息
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
	 * 得到最大页数
	 * (non-Javadoc)
	 * @see com.oa.travel.daoImpl.GoodsDao#computePageCount(int)
	 */
	public int computePageCount(int pageSize) {
		String sql = "select count(goodsId) as 'total' from goods ";
		ResultSet rs = super.executeQuery(sql);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);方法一
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
	 * 当员工要出差时需要向goods表中插入数据
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
	 * 当出差回来时需要将物品归还，此时实现更新
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
	 * 通过库存id和关联的出差申请查询唯一的物品信息
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
	 * 通过出差申请id查询物品
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
	   * 通过出差申请的id查询---视图关联查询---库存表物品名和物品
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
	 * 通过出差申请单id删除
	 */
	public int deleteByAppId(int appId) {
		 String sql="delete from goods where appId=?";
			 int ret=super.executeUpdate(sql, appId);
			 return ret;
	}
	/**
	 * 修改操作时撤销修改物品返回操作
	 */
	public int updateReturnFalse(int inventId, int goodsId) {
		String sql1="update goods set hasReturn='false' where goodsId="+goodsId;
		String sql2="update inventory set store=store-1 where inventId="+inventId;
		if(super.executeUpdate(sql1)!=0&&super.executeUpdate(sql2)!=0){
		  return 1;}else{
		return 0;}
	}
	
	/*
	 * 当员工要出差时需要向goods表中插入数据(小迈版)
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
		 * 查询出差申请未归还的物品
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
