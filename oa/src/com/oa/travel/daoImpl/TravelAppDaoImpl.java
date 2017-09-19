package com.oa.travel.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.travel.dao.TravelAppDao;
import com.oa.travel.entity.TravelApp;

public class TravelAppDaoImpl extends BaseDao implements TravelAppDao {

	/*
	 * 计算页数 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCount(int pageSize) {
		String sql = "select count(appId) as 'total' from travelApp  ";
		ResultSet rs = super.executeQuery(sql);
		int total = 0;
		try {
			if (rs.next()) {
				// rs.getInt(1);方法一
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

	/*
	 * 根据单据id删除单据信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#delete(int)
	 */
	public int delete(int tId) {
		String sql = "delete from travelApp  where appId=?";
		return super.executeUpdate(sql, tId);
	}

	/*
	 * 查询所有的单据信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll()
	 */
	public List<TravelApp> findAll() {
		List<TravelApp> list = new ArrayList<TravelApp>();
		String sql = "select * from travelApp ";
		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql);
		try {
			while (rs.next()) {
				t = new TravelApp();
				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
				list.add(t);
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
		return list;
	}

	/*
	 * 分页查询所有的单据信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */
	public List<TravelApp> findAll(int pageSize, int pageNo) {

		List<TravelApp> list = new ArrayList<TravelApp>();

		String sql = "select top " + pageSize
				+ " * from travelApp where appId not in(select top "
				+ (pageNo - 1) * pageSize + " appId from travelApp )";

		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql);
		try {
			while (rs.next()) {
				t = new TravelApp();

				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setEmpId(rs.getInt("empId"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
				list.add(t);
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
		return list;

	}

	/*
	 * 查找当前用户的所有单据信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findByEmpId(int)
	 */
	public List<TravelApp> findByEmpId(int empId) {
		List<TravelApp> list = new ArrayList<TravelApp>();
		String sql = "select * from travelApp where empId=?";
		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql, empId);
		try {
			while (rs.next()) {
				t = new TravelApp();
				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
				list.add(t);
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
		return list;

	}

	/*
	 * 根据单据状态查找单据信息 (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findByState(int, int)
	 */
	public List<TravelApp> findByState(int empId, int state) {
		List<TravelApp> list = new ArrayList<TravelApp>();
		String sql = "select * from travelApp where state=? and empId=?";
		List params = new ArrayList();
		params.add(state);
		params.add(empId);
		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql, params);
		try {
			while (rs.next()) {
				t = new TravelApp();
				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
				list.add(t);
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
		return list;
	}

	/*
	 * 增加单据 (non-Javadoc)
	 * 
	 * @see
	 * com.oa.travel.dao.TravelAppDao#insert(com.oa.travel.entity.TravelApp)
	 */
	public int insert(TravelApp t) {
		String sql = "insert into travelApp values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		List params = new ArrayList();
		params.add(t.getFormNo());
		params.add(t.getEmpId());
		params.add(t.getDeptId());
		params.add(t.getTravelReason());
		params.add(t.getTravelPlace());
		params.add(t.getPlanTime());
		params.add(t.getLeaveTime());
		params.add(t.getTrafficTools());
		params.add(t.getTrafficFee());
		params.add(t.getOrderTime());
		params.add(t.getHotelName());
		params.add(t.getRoomFee());
		params.add(t.getLeavePlan());
		params.add(t.getBackPlan());
		params.add(t.getState());
		return super.executeUpdate(sql, params);
	}

	/*
	 * 根据单据编号查找单据信息
	 */
	public TravelApp findByFormNo(String formNo) {
		String sql = "select * from travelApp where formNo=? ";
		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql, formNo);
		try {
			while (rs.next()) {
				t = new TravelApp();
				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setEmpId(rs.getInt("empId"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
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
		return t;
	}

	public TravelApp findById(int id) {
		String sql = "select * from travelApp where appId=? ";
		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql, id);
		try {
			while (rs.next()) {
				t = new TravelApp();
				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
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
		return t;
	}

	/**
	 * 根据用户和状态查找
	 */
	public List<TravelApp> findByEmpIdAndState(int empId, int state) {
		List<TravelApp> list = new ArrayList<TravelApp>();
		String sql = "select * from travelApp where empId=? and state=?";
		TravelApp t = null;
		List params = new ArrayList();
		params.add(empId);
		params.add(state);
		ResultSet rs = super.executeQuery(sql, params);
		try {
			while (rs.next()) {
				t = new TravelApp();
				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
				list.add(t);
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
		return list;
	}

	/* 申请人修改 */
	public int appupdate(int appId, String travelReason, String travelPlace,
			int planTime, Date leaveTime,int state) {
		String sql = "update travelApp set travelReason=?,travelPlace=?,planTime=?,leaveTime=? ,state=? where appId="
				+ appId;
		List params = new ArrayList();
		params.add(travelReason);
		params.add(travelPlace);
		params.add(planTime);
		params.add(leaveTime);
		params.add(state);
		int ret = super.executeUpdate(sql, params);
		return ret;
	}

	/*
	 * 分页查询所有的单据信息 (non-Javadoc)根据empId和state
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */

	public List<TravelApp> findAllByEmpIdAndState(int pageSize, int pageNo,
			int empId, int state) {
		List<TravelApp> list = new ArrayList<TravelApp>();

		String sql = "select top " + pageSize
				+ " * from travelApp where appId not in(select top "
				+ (pageNo - 1) * pageSize + " appId from travelApp )and empId="
				+ empId + "and state=" + state+" order by formNo desc";

		TravelApp t = null;
		ResultSet rs = super.executeQuery(sql);
		try {
			while (rs.next()) {
				t = new TravelApp();

				t.setAppId(rs.getInt("appId"));
				t.setFormNo(rs.getString("formNo"));
				t.setEmpId(rs.getInt("empId"));
				t.setDeptId(rs.getInt("deptId"));
				t.setTravelReason(rs.getString("travelReason"));
				t.setTravelPlace(rs.getString("travelPlace"));
				t.setPlanTime(rs.getInt("planTime"));
				t.setLeaveTime(rs.getDate("leaveTime"));
				t.setTrafficTools(rs.getString("trafficTools"));
				t.setTrafficFee(rs.getDouble("trafficFee"));
				t.setOrderTime(rs.getDate("orderTime"));
				t.setHotelName(rs.getString("hotelName"));
				t.setRoomFee(rs.getDouble("roomFee"));
				t.setLeavePlan(rs.getString("leavePlan"));
				t.setBackPlan(rs.getString("backPlan"));
				t.setState(rs.getInt("state"));
				list.add(t);
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
		return list;
	}

	/*
	 * 计算页数(在某种状态下) (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */

	public int computePageCountByState(int pageSize, int state) {
		String sql = "select count(appId) as 'total' from travelApp where state= "
				+ state;
		ResultSet rs = super.executeQuery(sql);
		int total = 0;
		try {
			if (rs.next()) {
				// rs.getInt(1);方法一
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

	/**
	 * 修改申请状态
	 */
	public int updateAppState(int appId, int newState) {
		String updateSql = "update TravelApp set state=? where appId=?";
		List params = new ArrayList();
		params.add(newState);
		params.add(appId);
		int ret = super.executeUpdate(updateSql, params);
		return ret;
	}
	/*
	 * 行政修改
	 */
	public int adupdate(int appId, String trafficTools, double trafficFee,
			Date orderTime, String hotelName, double roomFee, String leavePlan,
			String backPlan) {
		String sql = "update travelApp set trafficTools=?,"
				+ "trafficFee=?,orderTime=?,hotelName=?,roomFee=?,"
				+ "leavePlan=?,backPlan=? where appId=" + appId;
		List params = new ArrayList();
		params.add(trafficTools);
		params.add(trafficFee);
		params.add(orderTime);
		params.add(hotelName);
		params.add(roomFee);
		params.add(leavePlan);
		params.add(backPlan);

		int ret = super.executeUpdate(sql, params);
		return ret;

	}


}
