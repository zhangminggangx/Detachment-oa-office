package com.oa.rightmanagement.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.rightmanagement.dao.ModuleAclDao;
import com.oa.rightmanagement.entity.ModuleAcl;

public class ModuleAclDaoImpl extends BaseDao implements ModuleAclDao {

	public List<ModuleAcl> findByRoleId(int roleId) {
		String sql="select * from moduleAcl where roleId=?";
		List<ModuleAcl> moduleAcls=new ArrayList<ModuleAcl>();
		ModuleAcl moduleAcl =null;
		ResultSet rs=super.executeQuery(sql,roleId);
		try {
			while(rs.next())
			{
				moduleAcl=new ModuleAcl();
				moduleAcl.setRoleId(rs.getInt("roleId"));
				moduleAcl.setModId(rs.getInt("modId"));
				moduleAcl.setRoleModId(rs.getInt("roleModId"));
				moduleAcls.add(moduleAcl);
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
		return moduleAcls;
	}

	public List<ModuleAcl> findByRoleIdNotExist(int roleId) {
		
		String sql="select modId from  moduleAcl where roleId!=? and modId not in (select modId from moduleAcl where roleId="+roleId+") group by modId";
		List<ModuleAcl> moduleAcls=new ArrayList<ModuleAcl>();
		ModuleAcl moduleAcl =null;
		ResultSet rs=super.executeQuery(sql,roleId);
		try {
			while(rs.next())
			{
				moduleAcl=new ModuleAcl();
			//	moduleAcl.setRoleId(rs.getInt("roleId"));
				moduleAcl.setModId(rs.getInt("modId"));
			//	moduleAcl.setRoleModId(rs.getInt("roleModId"));
				moduleAcls.add(moduleAcl);
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
		return moduleAcls;
		
	}

	public int insert(ModuleAcl moduleAcl) {
		String sql="insert into moduleAcl values(?,?)";
		List params=new ArrayList();
		params.add(moduleAcl.getRoleId());
		params.add(moduleAcl.getModId());
		return super.executeUpdate(sql, params);
	}

	public int delete(int roleId) {
		String sql="delete from moduleAcl where roleId=?";
		return super.executeUpdate(sql, roleId);
	}

	
	
	
}
