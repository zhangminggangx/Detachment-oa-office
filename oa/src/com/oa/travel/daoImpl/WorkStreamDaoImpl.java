package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.WorkStreamDao;
import com.oa.travel.entity.WorkStream;

public class WorkStreamDaoImpl extends BaseDao implements WorkStreamDao{

	/*
	 *在提交一张单据的时候就workStream插入一条数据
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.WorkStreamDao#insert(com.oa.travel.entity.WorkStream)
	 */
	public int insert(WorkStream ws) {
        String sql="insert into workStream values(?,?,?,?)";
		List params=new ArrayList();
		params.add(ws.getFormNo());
		params.add(ws.getToId());
		params.add(ws.getFromId());
		params.add(ws.getHasApproved());
//		System.out.println(params.get(0));
//		System.out.println(params.get(1));
//		System.out.println(params.get(2));
//		System.out.println(params.get(3));
		return super.executeUpdate(sql,params);
	}


	/*
	 * 分页查询到待当前登录用户的审核的单据
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.WorkStreamDao#findByBossId(int, int, int)
	 */
	public List<WorkStream> findByBossId(int id,int pageSize,int pageNo) {
		String sql = "select top " + pageSize
				+ " * from workStream where  toId=" + id
				+ " and hasApproved='false'  and wsId not in(select top "
				+ ((pageNo - 1) * pageSize) + " wsId from workStream where toId="
				+ id + " and hasApproved='false' order by formNo desc)  order by formNo desc";
		ResultSet rs=super.executeQuery(sql);
		List<WorkStream> list=new ArrayList<WorkStream>();
		WorkStream ws=null;
		try {
			while(rs.next()){
				ws=new WorkStream();
				ws.setWsId(rs.getInt("wsId"));
				ws.setFormNo(rs.getString("formNo"));
				ws.setToId(rs.getInt("toId"));
				ws.setFromId(rs.getInt("fromId"));
				ws.setHasApproved(rs.getBoolean("hasApproved"));
				list.add(ws);
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
		return list;
	}
	/*
	 * 计算页数
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.WorkStreamDao#computePageCount(int)
	 */
	/*
	 * 计算页数 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.WorkStreamDao#computePageCount(int)
	 */
	public int computePageCount(int id, int pageSize,boolean hasApproved) {
		// TODO Auto-generated method stub
		String sql = "select count(wsId) as 'total' from workStream where toId=? and hasApproved=?  and FormNo like 'BX%'";
		List params = new ArrayList();
		params.add(id);
		params.add(hasApproved);
		ResultSet rs = super.executeQuery(sql, params);
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
	public int computePageCount(int id, int pageSize,boolean hasApproved,String likeFormNo) {
		// TODO Auto-generated method stub
		String sql = "select count(wsId) as 'total' from workStream where toId=? and hasApproved=? and FormNo like '"+likeFormNo+"%'";
		List params = new ArrayList();
		params.add(id);
		params.add(hasApproved);
		ResultSet rs = super.executeQuery(sql, params);
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

	public WorkStream findById(int wsId) {
		String sql = "select  * from workStream where wsId =?";
		ResultSet rs = super.executeQuery(sql,wsId);
		WorkStream ws = null;
		try {
			while (rs.next()) {
				ws = new WorkStream();
				ws.setWsId(rs.getInt("wsId"));
				ws.setFormNo(rs.getString("formNo"));
				ws.setToId(rs.getInt("toId"));
				ws.setFromId(rs.getInt("fromId"));
				ws.setHasApproved(rs.getBoolean("hasApproved"));
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
		return ws;
	}


	/*
	 * 根据单据编号查找工作流程信息
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.WorkStreamDao#findByFormNo(java.lang.String)
	 */
	public WorkStream findByFormNo(String formNo) {
		String sql = "select  * from workStream where formNo =?";
		ResultSet rs = super.executeQuery(sql,formNo);
		WorkStream ws = null;
		try {
			while (rs.next()) {
				ws = new WorkStream();
				ws.setWsId(rs.getInt("wsId"));
				ws.setFormNo(rs.getString("formNo"));
				ws.setToId(rs.getInt("toId"));
				ws.setFromId(rs.getInt("fromId"));
				ws.setHasApproved(rs.getBoolean("hasApproved"));
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
		return ws;
	}
	/*
	 * 当部门经理或者总经理进行审核的时候将指定的工作流程中的状态修改成已经修改
	 */
   public int updateHasApproved(int wsId){
	   String sql="update workStream set hasApproved='true' where wsId=?";
	   return super.executeUpdate(sql,wsId);
   }
	/**
	 * 查找某领导审核完的报销单
	 */


	public List<WorkStream> findApprovedDis(int empId, int pageSize, int pageNo) {
		String sql = "select top " + pageSize
				+ " * from workStream where  toId=" + empId
				+ " and hasApproved='true'  and " + "wsId "
				+ "not in(select top " + (pageNo - 1) * pageSize
				+ " wsId from workStream where toId=" + empId
				+ " and hasApproved='true' order by formNo desc) order by formNo desc";
		//System.out.println(sql);
		ResultSet rs = super.executeQuery(sql);
		List<WorkStream> list = new ArrayList<WorkStream>();
		WorkStream ws = null;
		try {
			while (rs.next()) {
				ws = new WorkStream();
				ws.setWsId(rs.getInt("wsId"));
				ws.setFormNo(rs.getString("formNo"));
				ws.setToId(rs.getInt("toId"));
				ws.setFromId(rs.getInt("fromId"));
				ws.setHasApproved(rs.getBoolean("hasApproved"));
				list.add(ws);
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
	

}
