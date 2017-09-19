package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.TravelReportDao;
import com.oa.travel.entity.TravelReport;

public class TravelReportDaoImpl extends BaseDao implements TravelReportDao {

	/*
	 * 获得页数
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#computePageCount(int)
	 */
	public int computePageCount(int pageSize) {
		String sql = "select count(reportId) as 'total' from travelReport";
		ResultSet rs = super.executeQuery(sql);
		int total =0;
		try {
			if(rs.next()){
				total=rs.getInt("total");
				System.out.println(total+"total---------");
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
	 * 根据单据id删除单据信息
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#delete(int)
	 */
	public int delete(int repId) {
		String sql="delete from travelReport  where reportId=?";
		return super.executeUpdate(sql,repId);
	}


	/*
	 * 查询所有的报告单信息
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#findAll()
	 */
	public List<TravelReport> findAll() {
		 List<TravelReport> list=new ArrayList<TravelReport>();
		 TravelReport report=null;
		 String sql="select * from TravelReport order by reportId desc";
		 ResultSet rs=super.executeQuery(sql);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
				 list.add(report);
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
		 return list;
	}

	/*
	 * 分页查找所有的报告单信息
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#findAll(int, int)
	 */
	public List<TravelReport> findAll(int pageSize, int pageNo) {
	   
		 List<TravelReport> list=new ArrayList<TravelReport>();
		 TravelReport report=null;
		 String sql="select top "+pageSize+
			" * from TravelReport where reportId not in(select top "+(pageNo-1)*pageSize+
			" reportId from TravelReport) order by formNo desc";
		 System.out.println(sql);
		 ResultSet rs=super.executeQuery(sql);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
				 list.add(report);
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
		 return list;
	}

	/*
	 * 找到当前用户的所有报告单
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#findByEmpId(int)
	 */
	public List<TravelReport> findByEmpId(int empId) {
		 List<TravelReport> list=new ArrayList<TravelReport>();
		 TravelReport report=null;
		 String sql="select * from TravelReport where empId=? order by formNo desc";
		 ResultSet rs=super.executeQuery(sql,empId);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
				 list.add(report);
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
		 return list;
	}

	/*
	 * 查询当前与用户的处于某种状态下的报告单
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#findByState(int, int)
	 */
	public List<TravelReport> findByState(int empId, int state) {
		 List<TravelReport> list=new ArrayList<TravelReport>();
		 TravelReport report=null;
		 String sql="select * from TravelReport where empId=? and state=? order by formNo desc";
		 List params=new ArrayList();
		 params.add(empId);
		 params.add(state);
		 ResultSet rs=super.executeQuery(sql,params);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
				 list.add(report);
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
		
		 return list;
	}

	/*
	 * 添加新报告
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#insert(com.oa.travel.entity.TravelReport)
	 */
	public int insert(TravelReport report) {
		String sql="insert into TravelReport values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		List params=new ArrayList();
		params.add(report.getFormNo());
		params.add(report.getEmpId());
		params.add(report.getDeptId());
		params.add(report.getRealTime());
		params.add(report.getTrafficTools());
		params.add(report.getTrafficFee());
		params.add(report.getHotelName());
		params.add(report.getPoliticId());
		params.add(report.getDisMoney());
		params.add(report.getAppId());
		params.add(report.getCustoms());
		params.add(report.getSummery());
		params.add(report.getState());
		return super.executeUpdate(sql, params);
	}

	/*
	 * 根据formNo找到出差报告单
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#findByFormNo(java.lang.String)
	 */
	public TravelReport findByFormNo(String formNo) {
		 TravelReport report=null;
		 String sql="select * from TravelReport where formNo=? ";
		 ResultSet rs=super.executeQuery(sql,formNo);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
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
		 return report;
	}

	/*
	 * 根据id查询报告单的信息
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelReportDao#findById(int)
	 */
	public TravelReport findById(int id) {
		 TravelReport report=null;
		 String sql="select * from TravelReport where reportId=? ";
		 ResultSet rs=super.executeQuery(sql,id);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
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
		 return report;
	}
	 /**
	    * 修改报告表
	    */
	public int update(int reportId, TravelReport newReport) {
		String updateSql = "update TravelReport set realTime=?,trafficTools=?,trafficFee=?" +
				",politicId=?,disMoney=?,appId=?,customs=?,summery=?,state=?" +
				" where reportId=?";
		List params = new ArrayList();
		params.add(newReport.getRealTime());
		params.add(newReport.getTrafficTools());
		params.add(newReport.getTrafficFee());
		params.add(newReport.getPoliticId());
		params.add(newReport.getDisMoney());
		params.add(newReport.getAppId());
		params.add(newReport.getCustoms());
		params.add(newReport.getSummery());
		params.add(newReport.getState());
		params.add(reportId);
		int ret=super.executeUpdate(updateSql, params);
		
		return ret;
	}
	  /**
	    * 修改报告单状态
	    */
	public int updateReportState(int reportId, int newState) {
		String updateSql = "update TravelReport set state=? where reportId=?";
		List params = new ArrayList();
		params.add(newState);
		params.add(reportId);
		int ret=super.executeUpdate(updateSql, params);
		
		return ret;
	}

	public List<TravelReport> findByState(int empId, int state, int pageSize,
			int pageNo) {
		 List<TravelReport> list=new ArrayList<TravelReport>();
		 TravelReport report=null;
		// String sql="select * from TravelReport where empId=? and state=?";
		 
		 String sql = "select top " + pageSize
			+ " * from TravelReport where reportId not in(select top "
			+ (pageNo - 1) * pageSize + " reportId from TravelReport )and empId=? and state=? order by formNo desc";
		 
		 List params=new ArrayList();
		 params.add(empId);
		 params.add(state);
		 ResultSet rs=super.executeQuery(sql,params);
		 try {
			while(rs.next())
			 {
				 report=new TravelReport();
				 report.setReportId(rs.getInt("reportId"));
				 report.setAppId(rs.getInt("appId"));
				 report.setHotelName(rs.getString("hotelName"));
				 report.setFormNo(rs.getString("formNo"));
				 report.setEmpId(rs.getInt("empId"));
				 report.setDeptId(rs.getInt("deptId"));
				 report.setRealTime(rs.getInt("realTime"));
				 report.setTrafficTools(rs.getString("trafficTools"));
				 report.setTrafficFee(rs.getDouble("trafficFee"));
				 report.setPoliticId(rs.getInt("politicId"));
				 report.setDisMoney(rs.getDouble("disMoney"));
				 report.setCustoms(rs.getString("customs"));
				 report.setSummery(rs.getString("summery"));
				 report.setState(rs.getInt("state"));
				 list.add(report);
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
		
		 return list;
	}

	  /**
	    * 
	    * 各状态分页
	    */
	public int computePageCountByState(int pageSize, int state) {
		String sql = "select count(reportId) as 'total' from travelReport where state="+state;
		ResultSet rs = super.executeQuery(sql);
		int total =0;
		try {
			if(rs.next()){
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

}
