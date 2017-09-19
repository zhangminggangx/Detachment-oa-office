package com.oa.travel.serviceImpl;

import java.util.List;

import com.oa.travel.daoImpl.ReceivedDaoImpl;
import com.oa.travel.entity.Received;
import com.oa.travel.service.ReceivedService;

public class ReceivedServiceImpl  implements ReceivedService{

	ReceivedDaoImpl receivedDaoImpl=new ReceivedDaoImpl();
	/**
	 * 添加新回赠
	 */
	public int add(Received received) {
		int ret=receivedDaoImpl.insert(received);
		return ret;
	}
	/**
	 * 通过出差报告id查询回赠礼品
	 */
	public Received searchByReportId(int reportId) {
		Received received=receivedDaoImpl.findByReportId(reportId);
		return received;
	}
	/**
	 * 修改回赠信息
	 * @param receivedId
	 * @param newReceivd
	 * @return
	 */
	public int update(int receivedId, Received newReceivd) {
		int ret=receivedDaoImpl.update(receivedId, newReceivd);
		return ret;
	}
	

	 /**
	  * 修改存入库存--
	  * @param r
	  * @return
	  */
	 public int updateHasPut(Received r,int reportId) {
	int ret=receivedDaoImpl.updateHasPut(r,reportId);
		return ret;
	}
	

}
