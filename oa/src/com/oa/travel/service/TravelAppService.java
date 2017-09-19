package com.oa.travel.service;

import java.util.Date;
import java.util.List;

import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;

public interface TravelAppService {
	/**
	 * 添加出差申请表
	 */
	int add(TravelApp travelApp );

	/**
	 * 修改出差申请表
	 */
	int modify(int appId);
	/**
	 * 查询用户和状态的申请单
	 */
	List<TravelApp> searchByEmpIdAndState(int empId,int state);
	/**
	 * 通过单号查找数据
	 */
	TravelApp searchByFormNo(String formNo);
	/**
	 * 通过id查询
	 */
	TravelApp searchById(int appId);
	
	/*
	 * 分页查询所有的单据信息
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */
	public List<TravelApp> searchAll(int pageSize, int pageNo); 
	/*
	 * 计算页数
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCount(int pageSize) ;
	
	/*申请人修改*/
	public int appupdate(int appId,
			String travelReason,String travelPlace, int planTime,
			Date leaveTime,int state);

	/**
	 * 查询我审核的出差申请单
	 */
	public List<TravelApp> searchApproveApp(
			List<WorkStream> workStreamsList);

	/*
	 * 分页查询所有的单据信息 (non-Javadoc)根据empId和state
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */

	public List<TravelApp> searchAllByEmpIdAndState(int pageSize, int pageNo,
			int empId, int state);
	
	/*
	 * 计算页数(在某种状态下)
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCountByState(int pageSize,int state);
	/**
	 * 修改申请单状态
	 */

	public int updateAppState(int appId, int newState);
	/*
	 * 行政修改
	 */
	public int adupdate(int appId, String trafficTools, double trafficFee,
			Date orderTime, String hotelName, double roomFee, String leavePlan,
			String backPlan);

	/**
	 * 删除
	 */
	int delete(int appId);

}
