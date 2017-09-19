package com.oa.deskTop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.deskTop.dao.ScheduleDao;
import com.oa.deskTop.entity.Schedule;

public class ScheduleDaoImpl extends BaseDao implements ScheduleDao {
	/**
	 * 查找某天的所有日程
	 */
	public List<Schedule> findAll(Date startDate) {
		String sql ="select * from  schedule where startDate=?";
		ResultSet rs = super.executeQuery(sql,startDate);
		List<Schedule> schList = new ArrayList<Schedule>();
		try {
			while(rs.next()){
				Schedule schedule = new Schedule();
				schedule.setStart(rs.getString("start"));
				schedule.setEnd(rs.getString("end"));
				schedule.setTitle(rs.getString("title"));
				schedule.setPlace(rs.getString("place"));
				schedule.setContents(rs.getString("contents"));
				schedule.setUid(rs.getInt("uId"));
				schList.add(schedule);
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
		
		return schList;
	}

	/**
	 * 按照日程id查找日程
	 */
	public Schedule findById(int scdId) {
		String sql ="select * from  schedule where scdId=?";
		ResultSet rs = super.executeQuery(sql,scdId);
		Schedule schedule =null;
		try {
			while(rs.next()){
				schedule = new Schedule();
				schedule.setStart(rs.getString("start"));
				schedule.setEnd(rs.getString("end"));
				schedule.setTitle(rs.getString("title"));
				schedule.setPlace(rs.getString("place"));
				schedule.setContents(rs.getString("contents"));
				schedule.setUid(rs.getInt("uId"));		
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
		return schedule;
	}
	/**
	 * 删除日程
	 */
	public int delete(int scdId) {
		String sql="delete from schedule where scdId=?";
		int ret=0;
		ret = super.executeUpdate(sql, scdId);
		return ret;
	}


	/**
	 * 增加新的日程
	 */
	public int insert(Schedule schedule) {
		String sql = "insert into schedule values(?,?,?,?,?,?)";
		int ret =0;
		List params = new ArrayList();
		params.add(schedule.getStart());
		params.add(schedule.getEnd());
		params.add(schedule.getTitle());
		params.add(schedule.getPlace());
		params.add(schedule.getContents());
		params.add(schedule.getUid());
		ret = super.executeUpdate(sql, params);
		return ret;
	}

	/**
	 * 查找用户的日程
	 */
	public List<Schedule> findByUid(int uid) {
		String sql ="select * from  schedule where uId=?";
		ResultSet rs = super.executeQuery(sql,uid);
		List<Schedule> schList = new ArrayList<Schedule>();
		try {
			while(rs.next()){
				Schedule schedule = new Schedule();
				schedule.setScdId(rs.getInt("scdId"));
			
				
				schedule.setStart(rs.getString("start"));
				schedule.setEnd(rs.getString("end"));
				schedule.setTitle(rs.getString("title"));
				schedule.setPlace(rs.getString("place"));
				schedule.setContents(rs.getString("contents"));
				schedule.setUid(uid);
				schList.add(schedule);
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
		
		return schList;
	}

	
	/**
	 * 修改用户的日程
	 */
	public int update(int sId ,Schedule schedule) {
		int ret=0;
		String sql="update schedule set start=?,[end]=?,title=? ,place=?,contents=? where scdId=?";
		List params = new ArrayList();
		params.add(schedule.getStart());
		params.add(schedule.getEnd());
		params.add(schedule.getTitle());
		params.add(schedule.getPlace());
		params.add(schedule.getContents());
		params.add(sId);
		ret = super.executeUpdate(sql, params);
		return ret;
	}

}
