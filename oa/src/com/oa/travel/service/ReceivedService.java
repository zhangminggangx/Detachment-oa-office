package com.oa.travel.service;

import com.oa.travel.entity.Received;

public interface ReceivedService {
	/**
	 * 添加回赠礼品
	 */
	int add(Received received);
	/**
	 * 通过出差报告id查询
	 */
	Received searchByReportId(int reportId);
	/**
	 * 修改回赠信息
	 * @param receivedId
	 * @param newReceivd
	 * @return
	 */
	 int update(int receivedId,Received newReceivd);
	 /**
	  * 修改存入库存与否
	  * @param r
	  * @return
	  */
	 public int updateHasPut(Received r,int reportId);
}
