package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.WorkStream;

public interface WorkStreamService {
   public int add(WorkStream ws);
   public List<WorkStream> findByBossId(int id,int pageSize,int pageNo);
	public WorkStream findById(int wsId);
	public WorkStream findByFormNo(String formNo);
	public int updateHasApproved(int wsId);
	public List<WorkStream> searchApprovedDis(int empId,int pageSize,int pageNo);
	public int computePageCount(int empId,int pageSize,boolean hasApproved);
	/**
	 * ��ѯδ��˱��浥����
	 */
	public List<WorkStream> findReportByBossId(int empId,int pageSize,int pageNo);
	/**
	 * ��ѯ����˱��浥����
	 */
	public List<WorkStream> findReportedByBossId(int empId,int pageSize,int pageNo);
	/**
	 * ��ѯ����˳������뵥����
	 */
	public List<WorkStream> findAppedByBossId(int empId, int pageSize,
			int pageNo);
	
	/**
	 * ��ѯ�����ѯ����
	 */
	public List<WorkStream> findAppByBossId(int empId, int pageSize,
			int pageNo);

	public int computePageCount(int id, int pageSize,boolean hasApproved,String likeFormNo);
	
	

}
