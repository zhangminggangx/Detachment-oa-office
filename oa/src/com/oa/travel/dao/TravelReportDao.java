package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.TravelReport;

public interface TravelReportDao {
	 public List<TravelReport> findAll();
	   public List<TravelReport> findAll(int pageSize,int pageNo);
	   public int computePageCount(int pageSize);
	   public List<TravelReport> findByState(int empId,int state);
	   /**
	    * 分页
	    * @param empId
	    * @param state
	    * @param pageSize
	    * @param pageNo
	    * @return
	    */
	   public List<TravelReport> findByState(int empId,int state,int pageSize,int pageNo);
	   public List<TravelReport> findByEmpId(int empId);
	   public int insert(TravelReport report);
	   public int delete(int repId); 
	   public TravelReport findByFormNo(String formNo);
	   public TravelReport findById(int id);
	   /**
	    * 修改报告表
	    */
	   int update(int reportId,TravelReport newReport);
	   /**
	    * 修改报告单状态
	    */
	   int updateReportState(int reportId,int newState);
	   /**
	    * 
	    * 各状态分页
	    */
	   int computePageCountByState(int pageSize,int state);
}
