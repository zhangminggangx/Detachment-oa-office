package com.oa.personnel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.personnel.dao.UserInfoDao;
import com.oa.personnel.entity.UserInfo;

public class UserInfoDaoImpl extends BaseDao implements UserInfoDao   {

	/*
	 * 根据用户的id删除用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#delete(int)
	 */
	public int delete(int uId) {
		String sql="delete  from userinfo where uid=?";
		return super.executeUpdate(sql, uId);
	}

	/*
	 * 查找所有的用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#findAll()
	 */
	public List<UserInfo> findAll() {
		List<UserInfo> list=new ArrayList<UserInfo>();
		String sql="select * from userinfo";
		ResultSet rs=super.executeQuery(sql);
		UserInfo u=null;
		try {
			while(rs.next()){
				u=new UserInfo();
				u.setUid(rs.getInt("uId"));
				u.setEmpNo(rs.getString("empNo"));
				u.setUpwd(rs.getString("uPwd"));
				u.setEmpName(rs.getString("empName"));
				u.setDeptName(rs.getString("deptName"));
				u.setEmpId(rs.getInt("empId"));
				u.setFileCapacity(rs.getLong("fileCapacity"));
				u.setFilePath(rs.getString("filePath"));
				u.setComEmail(rs.getString("comEmail"));
				u.setRoleId(rs.getInt("roleId"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{try {
			rs.close();super.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();	super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		}
		return list;
	}
	/*
	 * 分页查找用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#findAll(int, int)
	 */
	public List<UserInfo> findAll(int pageSize, int pageNo) {
		List<UserInfo> list=new ArrayList<UserInfo>();
		
		String sql="select top "+pageSize+" * from userInfo where uId not in(select top"+(pageNo-1)*pageSize+" uId from userInfo)";
		ResultSet rs=super.executeQuery(sql);
		UserInfo u=null;
		try {
			while(rs.next()){
				u=new UserInfo();
				u.setUid(rs.getInt("uId"));
				u.setEmpNo(rs.getString("empNo"));
				u.setUpwd(rs.getString("uPwd"));
				u.setEmpName(rs.getString("empName"));
				u.setDeptName(rs.getString("deptName"));
				u.setEmpId(rs.getInt("empId"));
				u.setFileCapacity(rs.getLong("fileCapacity"));
				u.setFilePath(rs.getString("filePath"));
				u.setComEmail(rs.getString("comEmail"));
				u.setRoleId(rs.getInt("roleId"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();	super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	/*
	 * 得到页数
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#getMaxPage(int)
	 */
	public int computePageCount(int pageSize) {
		String sql = "select count(uId) as 'total' from userInfo ";
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
	 * 根据用户的id查找用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#findById(int)
	 */
	public UserInfo findById(int uId) {
		String sql="select * from userinfo where uId=?";
		ResultSet rs=super.executeQuery(sql,uId);
		UserInfo u=null;
		try {
			while(rs.next()){
				u=new UserInfo();
				u.setUid(rs.getInt("uId"));
				u.setEmpNo(rs.getString("empNo"));
				u.setUpwd(rs.getString("uPwd"));
				u.setEmpName(rs.getString("empName"));
				u.setDeptName(rs.getString("deptName"));
				u.setEmpId(rs.getInt("empId"));
				u.setFileCapacity(rs.getLong("fileCapacity"));
				u.setFilePath(rs.getString("filePath"));
				u.setComEmail(rs.getString("comEmail"));
				u.setRoleId(rs.getInt("roleId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();	super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return u;
	}

	/*
	 * 插入一条用户信息
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#insert(com.oa.personnel.entity.UserInfo)
	 */
	public int insert(UserInfo u) {
		String sql="insert into userInfo values(?,?,?,?,?,?,?,?,?)";
		List params=new ArrayList();
		params.add(u.getEmpNo());
		params.add(u.getUpwd());
		params.add(u.getEmpName());
		params.add(u.getDeptName());
		params.add(u.getEmpId());
		params.add(u.getFilePath());
		params.add(u.getComEmail());
		params.add(u.getFileCapacity());
		params.add(2);//默认为职员角色
		return super.executeUpdate(sql, params);
	}

	/*
	 * 根据用户名和密码得到userInfo
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.UserInfoDao#findByUNamePwd(java.lang.String, java.lang.String)
	 */
	public UserInfo findByUNamePwd(String username, String pwd) {
		String sql="select * from userinfo where empNo=? and uPwd=?";
		List params=new ArrayList();
		params.add(username);params.add(pwd);
		ResultSet rs=super.executeQuery(sql,params);
		UserInfo u=null;
		try {
			while(rs.next()){
				u=new UserInfo();
				u.setUid(rs.getInt("uId"));
				u.setEmpNo(rs.getString("empNo"));
				u.setUpwd(rs.getString("uPwd"));
				u.setEmpName(rs.getString("empName"));
				u.setDeptName(rs.getString("deptName"));
				u.setEmpId(rs.getInt("empId"));
				u.setFileCapacity(rs.getLong("fileCapacity"));
				u.setFilePath(rs.getString("filePath"));
				u.setComEmail(rs.getString("comEmail"));
				u.setRoleId(rs.getInt("roleId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();	super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return u;
	}

	public int delete(String empNo) {
		String sql="delete  from userinfo where empNo=?";
		return super.executeUpdate(sql, empNo);
	}

	/**
	 * 修改用户权限
	 */
	public int updateRole(int uId, int roleId) {
		String sql = "update userInfo set roleId=? where uId=?";
		List params = new ArrayList();
		params.add(roleId);
		params.add(uId);
		int ret = super.executeUpdate(sql, params);
		
		return ret;
	}
	
	/*
	 * 修改密码
	 * */
		public int updatepwd(int uId, String uPwd) {
			String sql = "update userInfo set uPwd=? where uId="+ uId;
			List params = new ArrayList();
			params.add(uPwd);
			int ret = super.executeUpdate(sql, params);
			return ret;
		}

		public int updateRoleId(int roleId) {
			String sql="update userinfo set roleId=2 where roleId=?";
			return super.executeUpdate(sql, roleId);
		}


}
