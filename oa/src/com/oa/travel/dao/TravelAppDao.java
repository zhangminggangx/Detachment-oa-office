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
    * 查找用户具体状态的出差申请
    * @param t
    * @return
    */
   public List<TravelApp> findByEmpIdAndState(int empId,int state);
   public int insert(TravelApp t);
   public int delete(int tId); 
   /**
    * 通过单号查找
    * @param formNo
    * @return
    */
   public TravelApp findByFormNo(String formNo);
   public TravelApp findById(int id);
   //public int update();
   
	/*申请人修改*/
	public int appupdate(int appId,
			String travelReason,String travelPlace, int planTime,
			Date leaveTime,int state);
	/*
	 * 分页查询所有的单据信息 (non-Javadoc)根据empId和状态
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */
	public List<TravelApp> findAllByEmpIdAndState(int pageSize, int pageNo,int empId,int state);
	/*
	 * 计算页数(在某种状态下)
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCountByState(int pageSize,int state);
	/**
	 * 修改出差申请单状态
	 */

	public int updateAppState(int appId, int newState);

	/*
	 * 行政修改
	 * */
	public int adupdate(int appId,String trafficTools,double trafficFee,Date orderTime,
			String hotelName,double roomFee,String leavePlan,String backPlan);


}
