package com.oa.travel.service;

import com.oa.travel.entity.Received;

public interface ReceivedService {
	/**
	 * ��ӻ�����Ʒ
	 */
	int add(Received received);
	/**
	 * ͨ�������id��ѯ
	 */
	Received searchByReportId(int reportId);
	/**
	 * �޸Ļ�����Ϣ
	 * @param receivedId
	 * @param newReceivd
	 * @return
	 */
	 int update(int receivedId,Received newReceivd);
	 /**
	  * �޸Ĵ��������
	  * @param r
	  * @return
	  */
	 public int updateHasPut(Received r,int reportId);
}
