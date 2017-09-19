package com.oa.dispatch.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.dispatch.dao.DispatchDao;
import com.oa.dispatch.entity.Dispatch;

public class DispatchDaoImpl extends BaseDao implements DispatchDao {
	/**
	 * 通过报销单的id查找
	 */
	public Dispatch findByDisId(int disId) {
		String sql="select * from dispatch where disId=? order by createTime desc";
		ResultSet rs = super.executeQuery(sql, disId);
		Dispatch dispatch=null;
		try {
			while(rs.next()){
				dispatch=new Dispatch();
				dispatch.setDisId(rs.getInt("disId"));
				dispatch.setFormNo(rs.getString("formNo"));
				dispatch.setEmpId(rs.getInt("empId"));
				dispatch.setDeptId(rs.getInt("deptId"));
				dispatch.setCreateTime(rs.getDate("createTime"));
				dispatch.setDisMoney(rs.getDouble("disMoney"));
				dispatch.setDisReason(rs.getString("disReason"));
				dispatch.setState(rs.getInt("state"));
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
			}
		}
		return dispatch;
	}
	/**
	 * 根据报销单的单号查找
	 */
	public Dispatch findByFormNo(String formNo){
		String sql="select * from dispatch where formNo=?";
		ResultSet rs = super.executeQuery(sql, formNo);
		Dispatch dispatch=null;
		try {
			while(rs.next()){
				dispatch=new Dispatch();
				dispatch.setDisId(rs.getInt("disId"));
				dispatch.setFormNo(rs.getString("formNo"));
				dispatch.setEmpId(rs.getInt("empId"));
				dispatch.setDeptId(rs.getInt("deptId"));
				dispatch.setCreateTime(rs.getDate("createTime"));
				dispatch.setDisMoney(rs.getDouble("disMoney"));
				dispatch.setDisReason(rs.getString("disReason"));
				dispatch.setState(rs.getInt("state"));
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
			}
		}
		return dispatch;
	}
	/**
	 * 查找某个用户的某种状态的报销单
	 */
	public List<Dispatch> findByEmpId(int empId, int state) {
		String sql="select * from dispatch where empId=? and state=? order by createTime desc";
		List<Dispatch> disList = new ArrayList<Dispatch>();
		List params = new ArrayList();
		params.add(empId);
		params.add(state);
		ResultSet rs = super.executeQuery(sql, params);
		try {
			while(rs.next()){
				Dispatch dispatch=new Dispatch();
				dispatch.setDisId(rs.getInt("disId"));
				dispatch.setFormNo(rs.getString("formNo"));
				dispatch.setEmpId(rs.getInt("empId"));
				dispatch.setDeptId(rs.getInt("deptId"));
				dispatch.setCreateTime(rs.getDate("createTime"));
				dispatch.setDisMoney(rs.getDouble("disMoney"));
				dispatch.setDisReason(rs.getString("disReason"));
				dispatch.setState(rs.getInt("state"));
				disList.add(dispatch);
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
			}
		}
		return disList;
	}
	/**
	 * 分页查找某个用户的某种状态的报销单
	 */
	public List<Dispatch> findByEmpId(int empId, int state, int pageSize,
			int pageNo) {
		String sql="select top "+ pageSize+" * from dispatch where empId=? and state=? and disId not in(select top "+ ((pageNo-1)*pageSize) +" disId from dispatch order by createTime desc) order by createTime desc";
		List<Dispatch> disList = new ArrayList<Dispatch>();
		List params = new ArrayList();
		params.add(empId);
		params.add(state);
		ResultSet rs = super.executeQuery(sql, params);
		try {
			while(rs.next()){
				Dispatch dispatch=new Dispatch();
				dispatch.setDisId(rs.getInt("disId"));
				dispatch.setFormNo(rs.getString("formNo"));
				dispatch.setEmpId(rs.getInt("empId"));
				dispatch.setDeptId(rs.getInt("deptId"));
				dispatch.setCreateTime(rs.getDate("createTime"));
				dispatch.setDisMoney(rs.getDouble("disMoney"));
				dispatch.setDisReason(rs.getString("disReason"));
				dispatch.setState(rs.getInt("state"));
				disList.add(dispatch);
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
			}
		}
		return disList;
	}
	
	/**
	 * 计算某用户某种状态下的报销单的总页数
	 */
	public int computePageCount(int pageSize, int empId, int state) {
		String sql = "select count(disId) as 'total' from dispatch where state=? and empId=?";
		List params = new ArrayList();
		params.add(state);
		params.add(empId);
		ResultSet rs = super.executeQuery(sql,params);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);方法一
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
			}
		}
		
		return (total%pageSize==0?total/pageSize:total/pageSize+1);	
	}
	/**
	 * 删除报销单
	 */
	public int delete(int disId) {
		int ret=0;
		String sql ="delete from dispatch where disId=?";
		ret = super.executeUpdate(sql, disId);
		return ret;
	}

	/**
	 * 增加报销单
	 */
	public int insert(Dispatch dispatch) {
		String sql="insert into dispatch values(?,?,?,?,?,?,?)";
		int ret=0;
		List params = new ArrayList();
		params.add(dispatch.getFormNo());
		params.add(dispatch.getEmpId());
		params.add(dispatch.getDeptId());
		params.add(dispatch.getCreateTime());
		params.add(dispatch.getDisMoney());
		params.add(dispatch.getDisReason());
		params.add(dispatch.getState());
		ret=super.executeUpdate(sql, params);
		return ret;
	}
	
	/**
	 * 分页、根据员工查找报销单
	 */
	public List<Dispatch> findByEmpId(int empId, int pageSize, int pageNo) {
		String sql="select top "+ pageSize+" * from dispatch where empId=? and disId not in(select top "+ ((pageNo-1)*pageSize) +" disId from dispatch order by createTime desc) order by createTime desc";
		List<Dispatch> disList = new ArrayList<Dispatch>();

		ResultSet rs = super.executeQuery(sql, empId);
		try {
			while(rs.next()){
				Dispatch dispatch=new Dispatch();
				dispatch.setDisId(rs.getInt("disId"));
				dispatch.setFormNo(rs.getString("formNo"));
				dispatch.setEmpId(rs.getInt("empId"));
				dispatch.setDeptId(rs.getInt("deptId"));
				dispatch.setCreateTime(rs.getDate("createTime"));
				dispatch.setDisMoney(rs.getDouble("disMoney"));
				dispatch.setDisReason(rs.getString("disReason"));
				dispatch.setState(rs.getInt("state"));
				disList.add(dispatch);
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
			}
		}
		return disList;
	}
	/**
	 * 计算根据用户查找的总页数
	 */
	public int computePageCount(int pageSize, int empId) {
		String sql = "select count(disId) as 'total' from dispatch where empId=?";
		ResultSet rs = super.executeQuery(sql,empId);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);方法一
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
			}
		}
		
		return (total%pageSize==0?total/pageSize:total/pageSize+1);	
	}
	
	/**
	 * 查找某用户的所有报销单
	 */
	public List<Dispatch> findByEmpId(int empId) {
		String sql="select * from dispatch where empId=? order by createTime desc";
		List<Dispatch> disList = new ArrayList<Dispatch>();
		ResultSet rs = super.executeQuery(sql, empId);
		try {
			while(rs.next()){
				Dispatch dispatch=new Dispatch();
				dispatch.setDisId(rs.getInt("disId"));
				dispatch.setFormNo(rs.getString("formNo"));
				dispatch.setEmpId(rs.getInt("empId"));
				dispatch.setDeptId(rs.getInt("deptId"));
				dispatch.setCreateTime(rs.getDate("createTime"));
				dispatch.setDisMoney(rs.getDouble("disMoney"));
				dispatch.setDisReason(rs.getString("disReason"));
				dispatch.setState(rs.getInt("state"));
				disList.add(dispatch);
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
			}
		}
		return disList;
	}
	/**
	 * 查找最大的disId号
	 */
	public int findMaxId() {
		String sql = "select top 1 disId as 'maxId' from dispatch order by disId desc";
		ResultSet rs = super.executeQuery(sql);
		int maxId =0;
		try {
			if(rs.next()){
				//rs.getInt(1);方法一
				maxId=rs.getInt("maxId");
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
			}
		}
		
		return maxId;
	}
	/**
	 * 更新报销单的状态
	 */
	public int updateState(String formNo,int state) {
		int ret=0;
		String sql="update dispatch set state=? where formNo=?";
		List params = new ArrayList();
		params.add(state);
		params.add(formNo);
		ret = super.executeUpdate(sql, params);
		return ret;
	}
	/*
	 * 修改dispatch对象
	 * (non-Javadoc)
	 * @see com.oa.dispatch.dao.DispatchDao#updateDispatch(com.oa.dispatch.entity.Dispatch)
	 */
	public int updateDispatch(Dispatch dis) {

		String sql="update  dispatch set disMoney=? where disId=?";
		List params = new ArrayList();
		params.add(dis.getDisMoney());
		params.add(dis.getDisId());
		return super.executeUpdate(sql, params);
	}

}
