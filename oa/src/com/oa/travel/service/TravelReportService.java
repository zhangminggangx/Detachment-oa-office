package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.TravelReport;
import com.oa.travel.entity.WorkStream;

public interface TravelReportService {
	
	/**
	 * 添加新出差报告
	 */
	int add(TravelReport travelReport);
	/**
	 * 根据单号查询
	 */
	TravelReport searchByFormNo(String FormNo );
	/**
	 * 分页查找
	 */
	List<TravelReport> sreachAll(int pageSize,int pageNo);
	/**
	 * 总页数
	 */
	int computePageCount(int pageSize);
	
	   /**
	    * 修改报告表
	    */
	   int update(int reportId,TravelReport newReport);
	   /**
	    * 查询我审核的报告单
	    */
	   List<TravelReport> searchApproveReport(List<WorkStream> workStreamsList);
	   
	   /**
	    * 修改报告单状态
	    */
	   int updateReportState(int reportId,int newState);
	   /**
		 * 查询用户和状态的报告单
		 */
		List<TravelReport> searchByEmpIdAndState(int empId,int state);

		   public List<TravelReport> searchByEmpIdAndState(int empId,int state,int pageSize,int pageNo);
		   /**
		    * 
		    * 各状态分页
		    */
		public int computePageCountByState(int pageSize, int state) ;

		/**
		 * 删除
		 * @param repId
		 * @return
		 */
		  public int delete(int repId);

}
