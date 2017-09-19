package com.oa.rightmanagement.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.rightmanagement.dao.RoleDao;
import com.oa.rightmanagement.entity.Role;

public class RoleDaoImpl extends BaseDao implements RoleDao {

	public int delete(int roleId) {
		String sql = "delete from roles where roleId=?";
		return super.executeUpdate(sql, roleId);
	}

	public List<Role> findAll() {
		List<Role> list = new ArrayList<Role>();
		String sql = "select * from roles";
		ResultSet rs = super.executeQuery(sql);
		Role r = null;
		try {
			while (rs.next()) {
				r = new Role();
				r.setRoleId(rs.getInt("roleId"));
				r.setRoleName(rs.getString("roleName"));
				r.setRoleDesc(rs.getString("roleDesc"));
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return list;
	}

	public Role findById(int roleId) {
		String sql = "select * from roles where roleId=?";
		ResultSet rs = super.executeQuery(sql, roleId);
		Role r = null;
		try {
			while (rs.next()) {
				r = new Role();
				r.setRoleId(rs.getInt("roleId"));
				r.setRoleName(rs.getString("roleName"));
				r.setRoleDesc(rs.getString("roleDesc"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return r;
	}

	public int insert(Role role) {
		String sql = "insert into roles values(?,?)";
		List params = new ArrayList();
		params.add(role.getRoleName());
		params.add(role.getRoleDesc());
		return super.executeUpdate(sql, params);
	}

	public int update(Role role) {
		String sql = "update roles set roleName=?,roleDesc=?";
		List params = new ArrayList();
		params.add(role.getRoleName());
		params.add(role.getRoleDesc());
		return super.executeUpdate(sql, params);
	}

}
