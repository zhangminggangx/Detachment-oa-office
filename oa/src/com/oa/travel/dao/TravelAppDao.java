package com.oa.travel.dao;

import java.util.Date;
import java.util.List;

import com.oa.travel.entity.TravelApp;

public interface TravelAppDao {
   public List<TravelApp> findAll();
   public List<TravelApp> findAll(int pageSize,int pageNo);
   public int computePageCount(int pageSize);
   public List<TravelApp> findByState(int empId,int state);
   public List<TravelApp> findByEmpId(int empId);
   /**
    * �����û�����״̬�ĳ�������
    * @param t
    * @return
    */
   public List<TravelApp> findByEmpIdAndState(int empId,int state);
   public int insert(TravelApp t);
   public int delete(int tId); 
   /**
    * ͨ�����Ų���
    * @param formNo
    * @return
    */
   public TravelApp findByFormNo(String formNo);
   public TravelApp findById(int id);
   //public int update();
   
	/*�������޸�*/
	public int appupdate(int appId,
			String travelReason,String travelPlace, int planTime,
			Date leaveTime,int state);
	/*
	 * ��ҳ��ѯ���еĵ�����Ϣ (non-Javadoc)����empId��״̬
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */
	public List<TravelApp> findAllByEmpIdAndState(int pageSize, int pageNo,int empId,int state);
	/*
	 * ����ҳ��(��ĳ��״̬��)
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCountByState(int pageSize,int state);
	/**
	 * �޸ĳ������뵥״̬
	 */

	public int updateAppState(int appId, int newState);

	/*
	 * �����޸�
	 * */
	public int adupdate(int appId,String trafficTools,double trafficFee,Date orderTime,
			String hotelName,double roomFee,String leavePlan,String backPlan);


}
