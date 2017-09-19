package com.oa.travel.service;

import java.util.Date;
import java.util.List;

import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;

public interface TravelAppService {
	/**
	 * ��ӳ��������
	 */
	int add(TravelApp travelApp );

	/**
	 * �޸ĳ��������
	 */
	int modify(int appId);
	/**
	 * ��ѯ�û���״̬�����뵥
	 */
	List<TravelApp> searchByEmpIdAndState(int empId,int state);
	/**
	 * ͨ�����Ų�������
	 */
	TravelApp searchByFormNo(String formNo);
	/**
	 * ͨ��id��ѯ
	 */
	TravelApp searchById(int appId);
	
	/*
	 * ��ҳ��ѯ���еĵ�����Ϣ
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */
	public List<TravelApp> searchAll(int pageSize, int pageNo); 
	/*
	 * ����ҳ��
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCount(int pageSize) ;
	
	/*�������޸�*/
	public int appupdate(int appId,
			String travelReason,String travelPlace, int planTime,
			Date leaveTime,int state);

	/**
	 * ��ѯ����˵ĳ������뵥
	 */
	public List<TravelApp> searchApproveApp(
			List<WorkStream> workStreamsList);

	/*
	 * ��ҳ��ѯ���еĵ�����Ϣ (non-Javadoc)����empId��state
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */

	public List<TravelApp> searchAllByEmpIdAndState(int pageSize, int pageNo,
			int empId, int state);
	
	/*
	 * ����ҳ��(��ĳ��״̬��)
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCountByState(int pageSize,int state);
	/**
	 * �޸����뵥״̬
	 */

	public int updateAppState(int appId, int newState);
	/*
	 * �����޸�
	 */
	public int adupdate(int appId, String trafficTools, double trafficFee,
			Date orderTime, String hotelName, double roomFee, String leavePlan,
			String backPlan);

	/**
	 * ɾ��
	 */
	int delete(int appId);

}
