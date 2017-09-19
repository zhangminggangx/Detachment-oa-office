package com.oa.deskTop.service;

import java.util.List;

import com.oa.deskTop.entity.Schedule;

public interface ScheduleService {
	
	/**
	 * ������ճ�
	 * @param schedule
	 * @return
	 */
	public int add(Schedule schedule);

	/**
	 * ��ѯ�û����ճ�
	 * @param uid
	 * @return
	 */
	public List<Schedule> searchByUid(int uid);
	
	/**
	 * �޸��û����ճ�
	 */
		public int update(int sId ,Schedule schedule) ;
		/**
		 * ɾ���ճ�
		 * @param scdId
		 * @return
		 */
		 int delete(int scdId);
}
