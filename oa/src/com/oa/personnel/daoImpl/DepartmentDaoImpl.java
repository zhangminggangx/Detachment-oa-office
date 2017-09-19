package com.oa.personnel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.personnel.dao.DepartmentDao;
import com.oa.personnel.entity.Department;

public class DepartmentDaoImpl extends BaseDao implements DepartmentDao {
	/**
	   * ͨ���������Ʋ���
	   */
	public Department findByDeptName(String deptName) {
		String sql="select * from department where deptName=?";
		ResultSet rs=super.executeQuery(sql,deptName);
		Department d=null;
		try {
			while(rs.next())
			{
				d=new Department();
				d.setDeptId(rs.getInt("deptId"));
				d.setDeptName(rs.getString("deptName"));
				d.setDeptCharger(rs.getString("deptCharger"));
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
		return d;
	}
	/*
	 * ���ݲ��ŵ�id ���в��ŵ�ɾ��
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.DepartmentDao#delete(int)
	 */
	public int delete(int dId) {
		String sql="delete * from department where deptId=?";
		return super.executeUpdate(sql, dId);
	}

	/*
	 * �������еĲ�����Ϣ
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.DepartmentDao#findAll()
	 */
	public List<Department> findAll() {
		List<Department> list=new ArrayList<Department>();
		String sql="select * from department";
		ResultSet rs=super.executeQuery(sql);
		Department d=null;
		try {
			while(rs.next())
			{
				d=new Department();
				d.setDeptId(rs.getInt("deptId"));
				d.setDeptName(rs.getString("deptName"));
				d.setDeptCharger(rs.getString("deptCharger"));
				list.add(d);
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
		return list;
	}

	/*
	 * ��ҳ���Ҳ�����Ϣ
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.DepartmentDao#findAll(int, int)
	 */
	public List<Department> findAll(int pageSize, int pageNo) {
		List<Department> list=new ArrayList<Department>();
		String sql="select top "+pageSize+" * from department where deptId not in(select top "+(pageNo-1)*pageSize+" deptId from department)";
		ResultSet rs=super.executeQuery(sql);
		Department d=null;
		try {
			while(rs.next())
			{
				d=new Department();
				d.setDeptId(rs.getInt("deptId"));
				d.setDeptName(rs.getString("deptName"));
				d.setDeptCharger(rs.getString("deptCharger"));
				list.add(d);
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
		return list;
	}
	/*
	 * �õ�ҳ��
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.DepartmentDao#getMaxPage(int)
	 */
	public int computePageCount(int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select count(deptId) as 'total' from department ";
		ResultSet rs = super.executeQuery(sql);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);����һ
				total=rs.getInt("total");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				super.close();
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
		}
		return (total%pageSize==0?total/pageSize:total/pageSize+1);	
}
	/*
	 * ���ݲ���id���Ҳ�����Ϣ
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.DepartmentDao#findById(int)
	 */
	public Department findById(int dId) {
		String sql="select * from department where deptId=?";
		ResultSet rs=super.executeQuery(sql,dId);
		Department d=null;
		try {
			while(rs.next())
			{
				d=new Department();
				d.setDeptId(rs.getInt("deptId"));
				d.setDeptName(rs.getString("deptName"));
				d.setDeptCharger(rs.getString("deptCharger"));
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
		return d;
	}

	/*
	 * ����һ��������Ϣ
	 * (non-Javadoc)
	 * @see com.oa.personnel.dao.DepartmentDao#insert(com.oa.personnel.entity.Department)
	 */
	public int insert(Department d) {
		String sql="insert into department values(?,?)";
		List params=new ArrayList();
		params.add(d.getDeptName());
		params.add(d.getDeptCharger());
		return super.executeUpdate(sql, params);
	}
	/**
	 * ͨ�����������Ҳ���id
	 */
	public int findIdByName(String deptName) {
		String sql = "select deptId from department where deptName=?";
		ResultSet rs = super.executeQuery(sql, deptName);
		int deptId=0;
		try {
			while(rs.next()){
				deptId=rs.getInt("deptId");
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
		return deptId;
	}

	

}
