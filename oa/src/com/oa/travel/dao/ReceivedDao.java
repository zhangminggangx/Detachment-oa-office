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
	 * ͨ�����浥�Ų�ѯ������Ʒ��Ĭ��ֻ��һ����
	 * @param reportId
	 * @return
	 */
	 Received findByReportId(int reportId);
	/**
	 * �޸Ļ�����Ϣ
	 */
	 int update(int receivedId,Received newReceivd);
	

}
