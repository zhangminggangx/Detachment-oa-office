package com.oa.rightmanagement.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.rightmanagement.dao.ModuleDao;
import com.oa.rightmanagement.entity.Module;

public class ModuleDaoImpl extends BaseDao implements ModuleDao {

	public Module findById(int modId) {
		String sql="select * from module where modId=?";
		Module mod=null;
		ResultSet rs=super.executeQuery(sql, modId);
		try {
			while(rs.next())
			{
				mod=new Module();
				mod.setModId(modId);
				mod.setModName(rs.getString("modName"));
				mod.setModParentId(rs.getInt("modParentId"));
				mod.setModState(rs.getInt("modState"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return mod;
	}


}
