package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.InventoryDao;
import com.oa.travel.entity.Inventory;

public class InventoryDaoImpl extends BaseDao implements InventoryDao {

	/*
	 * 根据库存id删除库存信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.InventoryDao#delete()
	 */
	public int delete(int id) {
		String sql = "delete * from inventory where inventId=?";
		return super.executeUpdate(sql, id);
	}

	/*
	 * 查询所有的库存信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.InventoryDao#findAll()
	 */
	public List<Inventory> findAll() {
		List<Inventory> list = new ArrayList<Inventory>();
		String sql = "select * from inventory";
		ResultSet rs = super.executeQuery(sql);
		Inventory i = null;
		try {
			while (rs.next()) {
				i = new Inventory();
				i.setInventId(rs.getInt("inventId"));
				i.setGoodsName(rs.getString("goodsName"));
				i.setStore(rs.getInt("store"));
				i.setPrice(rs.getDouble("store"));
				i.setTypes(rs.getString("types"));
				list.add(i);
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

	/*
	 * 分页查询所有的库存信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.InventoryDao#findAll(int, int)
	 */
	public List<Inventory> findAll(int pageSize, int pageNo) {
		List<Inventory> list = new ArrayList<Inventory>();
		String sql = "select top " + pageSize
				+ " * from inventory where inventId not in(select top"
				+ (pageNo - 1) * pageSize + " inventId from inventory)";
		ResultSet rs = super.executeQuery(sql);
		Inventory i = null;
		try {
			while (rs.next()) {
				i = new Inventory();
				i.setInventId(rs.getInt("inventId"));
				i.setGoodsName(rs.getString("goodsName"));
				i.setStore(rs.getInt("store"));
				i.setPrice(rs.getDouble("store"));
				i.setTypes(rs.getString("types"));
				list.add(i);
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

	/*
	 * 得到页数 (non-Javadoc)
	 * 
	 * @see com.oa.personnel.dao.EmployeeDao#getMaxPage(int)
	 */
	public int computePageCount(int pageSize) {
		String sql = "select count(inventId) as 'total' from inventory ";
		ResultSet rs = super.executeQuery(sql);
		int total = 0;
		try {
			if (rs.next()) {
				total = rs.getInt("total");
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
		return (total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
	}

	/*
	 * 根据id寻找库存信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.InventoryDao#findById(int)
	 */
	public Inventory findById(int id) {
		String sql = "select * from inventory where inventId=?";
		ResultSet rs = super.executeQuery(sql, id);
		Inventory i = null;
		try {
			while (rs.next()) {
				i = new Inventory();
				i.setInventId(rs.getInt("inventId"));
				i.setGoodsName(rs.getString("goodsName"));
				i.setStore(rs.getInt("store"));
				i.setPrice(rs.getDouble("store"));
				i.setTypes(rs.getString("types"));
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
		return i;
	}

	/*
	 * 增加库存信息 (non-Javadoc)
	 * 
	 * @see
	 * com.oa.travel.dao.InventoryDao#insert(com.oa.travel.entity.Inventory)
	 */
	public int insert(Inventory i) {
		String sql = "insert into inventory values(?,?,?,?)";
		List params = new ArrayList();
		params.add(i.getGoodsName());
		params.add(i.getStore());
		params.add(i.getPrice());
		params.add(i.getTypes());
		return super.executeUpdate(sql, params);
	}

	/*
	 * 根据库存类型寻找库存信息，拉出所有的物品和礼品列表信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.InventoryDao#findByTypes(java.lang.String)
	 */
	public List<Inventory> findByTypes(String types) {
		List<Inventory> list = new ArrayList<Inventory>();
		String sql = "select * from inventory where types='" + types+"'"
				+ " and store>0";
		ResultSet rs = super.executeQuery(sql);
		Inventory i = null;
		try {
			while (rs.next()) {
				i = new Inventory();
				i.setInventId(rs.getInt("inventId"));
				i.setGoodsName(rs.getString("goodsName"));
				i.setStore(rs.getInt("store"));
				i.setPrice(rs.getDouble("price"));
				i.setTypes(rs.getString("types"));
				list.add(i);
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
		return list;
	}

	/**
	 * 通过名称，类型 查询
	 */
	public Inventory findByNameAndType(String inventoryName, String type) {
		String sql = "select * from inventory where goodsName=? and types=?";
		List params = new ArrayList();
		params.add(inventoryName);
		params.add(type);
		ResultSet rs = super.executeQuery(sql, params);
		Inventory i = null;
		try {
			if (rs.next()) {
				i = new Inventory();
				i.setInventId(rs.getInt("inventId"));
				i.setGoodsName(rs.getString("goodsName"));
				i.setStore(rs.getInt("store"));
				i.setPrice(rs.getDouble("store"));
				i.setTypes(rs.getString("types"));
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
		return i;
	}

	/**
	 * 修改库存
	 */
	public int updateStore(int InventId) {
		String updateSql = "update inventory set store=store+1 where inventId=?";
		int ret = super.executeUpdate(updateSql, InventId);
		return ret;
	}
	
	/**
	    * (减去)修改库存(物品)
	    */

	public int reduceStore(int InventId) {
		String updateSql = "update inventory set store=store-1 where inventId=?";
		int ret = super.executeUpdate(updateSql, InventId);
		return ret;
	}
	/**
	    * (减去)修改库存(礼品)
	    */

	public int reducePStore(int number,int InventId) {
		List params = new ArrayList();
		
		params.add(number);
		params.add(InventId);
		String updateSql = "update inventory set store=store-? where inventId=?";
		int ret = super.executeUpdate(updateSql, params);
		return ret;
	}
	
	/**
	    * (添加)修改库存(礼品)
	    */

	public int addPStore(int number, int InventId) {
    List params = new ArrayList();
		
		params.add(number);
		params.add(InventId);
		String updateSql = "update inventory set store=store+? where inventId=?";
		int ret = super.executeUpdate(updateSql, params);
		return ret;
	}

	
	

}
