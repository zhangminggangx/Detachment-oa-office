package com.oa.rightmanagement.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.rightmanagement.dao.FunACLDao;
import com.oa.rightmanagement.entity.FunACL;
import com.oa.rightmanagement.entity.ModuleFun;

public class FunACLDaoImpl extends BaseDao implements FunACLDao{

	public List<FunACL> findByRoleId(int roleId) {
		List<FunACL> funACLs=new ArrayList<FunACL>();
		FunACL funACL=null;
		String sql="select * from funACL where roleId=?";
		ResultSet rs=super.executeQuery(sql,roleId);
		try {
			while(rs.next())
			{
				funACL=new FunACL();
				funACL.setFunId(rs.getInt("funId"));
				funACL.setRoleFunId(rs.getInt("roleFunId"));
				funACL.setRoleId(rs.getInt("roleId"));
				funACLs.add(funACL);
				
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
		return funACLs;
	}

	public int insert(int roleId,int funId) {
		String sql="insert into funACL values(?,?)";
		List params=new ArrayList();
		params.add(roleId);
		params.add(funId);
		return super.executeUpdate(sql, params);
	}

	public int deleteByRoleId(int roleId) {
		String sql="delete from funACL where roleId=?";
		return super.executeUpdate(sql, roleId);
	}

}
