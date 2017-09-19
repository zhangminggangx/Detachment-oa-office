package com.oa.deskTop.service;

import java.util.List;

import com.oa.deskTop.entity.Schedule;

public interface ScheduleService {
	
	/**
	 * 添加新日程
	 * @param schedule
	 * @return
	 */
	public int add(Schedule schedule);

	/**
	 * 查询用户的日程
	 * @param uid
	 * @return
	 */
	public List<Schedule> searchByUid(int uid);
	
	/**
	 * 修改用户的日程
	 */
		public int update(int sId ,Schedule schedule) ;
		/**
		 * 删除日程
		 * @param scdId
		 * @return
		 */
		 int delete(int scdId);
}
