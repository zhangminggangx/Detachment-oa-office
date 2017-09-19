package com.oa.deskTop.dao;

import java.util.Date;
import java.util.List;

import com.oa.deskTop.entity.Schedule;

public interface ScheduleDao {
	public List<Schedule> findAll(Date startDate);
	public Schedule findById(int scdId);
	public int insert(Schedule schedule);
	public int delete(int scdId);
	/**
	 * �����û����ճ�
	 */
	public List<Schedule> findByUid(int uid);
/**
 * �޸��û����ճ�
 */
	public int update(int sId ,Schedule schedule) ;
	
	

}
