package com.oa.rightmanagement.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.rightmanagement.dao.ModuleFunDao;
import com.oa.rightmanagement.entity.ModuleFun;

public class ModuleFunDaoImpl extends BaseDao implements ModuleFunDao{

	public ModuleFun findById(int funId){
		String sql="select * from moduleFun where funId=?";
		ModuleFun moduleFun=null;
		ResultSet rs=super.executeQuery(sql,funId);
		try {
			while(rs.next())
			{
				moduleFun=new ModuleFun();
				moduleFun.setFunCode(rs.getString("funCode"));
				moduleFun.setFunId(rs.getInt("funId"));
				moduleFun.setFunName(rs.getString("funName"));
				moduleFun.setFunState(rs.getInt("funState"));
				moduleFun.setModId(rs.getInt("modId"));
				
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
		return moduleFun;
	}
	
	public List<ModuleFun> findByModuleId(int moduleId){
		List<ModuleFun> moduleFuns=new ArrayList<ModuleFun>();
		String sql="select * from moduleFun where modId=? and funstate=1";
		ModuleFun moduleFun=null;
		ResultSet rs=super.executeQuery(sql,moduleId);
		try {
			while(rs.next())
			{
				moduleFun=new ModuleFun();
				moduleFun.setFunCode(rs.getString("funCode"));
				moduleFun.setFunId(rs.getInt("funId"));
				moduleFun.setFunName(rs.getString("funName"));
				moduleFun.setFunState(rs.getInt("funState"));
				moduleFun.setModId(rs.getInt("modId"));
				moduleFuns.add(moduleFun);
				
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
		return moduleFuns;
	}
	/**
	 * ¸ù¾ÝFunCode²éÕÒ
	 */
	public ModuleFun findByFunCode(String funCode) {
		String sql="select * from moduleFun where funCode=?";
		ResultSet rs = super.executeQuery(sql, funCode);
		ModuleFun moduleFun=null;
		try {
			while(rs.next()){
				moduleFun = new ModuleFun();
				moduleFun.setFunId(rs.getInt("funId"));
				moduleFun.setModId(rs.getInt("modId"));
				moduleFun.setFunName(rs.getString("funName"));
				moduleFun.setFunCode(rs.getString("funCode"));
				moduleFun.setFunState(rs.getInt("funState"));
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
		return moduleFun;
	}
}
