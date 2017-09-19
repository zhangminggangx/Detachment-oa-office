package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.daoImpl.ScheduleDaoImpl;
import com.oa.deskTop.entity.Schedule;
import com.oa.deskTop.service.ScheduleService;

public class ScheduleServiceImpl implements ScheduleService {

	private ScheduleDaoImpl scheduleDaoImpl=new ScheduleDaoImpl();
	/**
	 * 添加新日程
	 * @param schedule
	 * @return
	 */
	public int add(Schedule schedule) {
		int ret=scheduleDaoImpl.insert(schedule);
		return ret;
	}
	/**
	 * 查询用户的日程
	 * @param uid
	 * @return
	 */
	public List<Schedule> searchByUid(int uid) {
		 List<Schedule> schedulesList=scheduleDaoImpl.findByUid(uid);
		return schedulesList;
	}
	
	/**
	 * 修改用户的日程
	 */
	public int update(int sId, Schedule schedule) {
		int ret=scheduleDaoImpl.update(sId, schedule);
		return ret;
	}
	
	/**
	 * 删除日程
	 * @param scdId
	 * @return
	 */
	public int delete(int scdId) {
		int ret=scheduleDaoImpl.delete(scdId);
		return ret;
	}

}
