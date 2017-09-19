package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.Received;

public interface ReceivedDao {
	public List<Received> findAll();

	public List<Received> findAll(int pageSize, int pageNo);

	public int insert(Received r);

	public int delete(int id);

	public int computePageCount(int pageSize);
	
	public int updateHasPut(Received r,int ReportId);
	/**
	 * 通过报告单号查询回赠礼品（默认只有一个）
	 * @param reportId
	 * @return
	 */
	 Received findByReportId(int reportId);
	/**
	 * 修改回赠信息
	 */
	 int update(int receivedId,Received newReceivd);
	

}
