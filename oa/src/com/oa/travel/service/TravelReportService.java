package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.TravelReport;
import com.oa.travel.entity.WorkStream;

public interface TravelReportService {
	
	/**
	 * ����³����
	 */
	int add(TravelReport travelReport);
	/**
	 * ���ݵ��Ų�ѯ
	 */
	TravelReport searchByFormNo(String FormNo );
	/**
	 * ��ҳ����
	 */
	List<TravelReport> sreachAll(int pageSize,int pageNo);
	/**
	 * ��ҳ��
	 */
	int computePageCount(int pageSize);
	
	   /**
	    * �޸ı����
	    */
	   int update(int reportId,TravelReport newReport);
	   /**
	    * ��ѯ����˵ı��浥
	    */
	   List<TravelReport> searchApproveReport(List<WorkStream> workStreamsList);
	   
	   /**
	    * �޸ı��浥״̬
	    */
	   int updateReportState(int reportId,int newState);
	   /**
		 * ��ѯ�û���״̬�ı��浥
		 */
		List<TravelReport> searchByEmpIdAndState(int empId,int state);

		   public List<TravelReport> searchByEmpIdAndState(int empId,int state,int pageSize,int pageNo);
		   /**
		    * 
		    * ��״̬��ҳ
		    */
		public int computePageCountByState(int pageSize, int state) ;

		/**
		 * ɾ��
		 * @param repId
		 * @return
		 */
		  public int delete(int repId);

}
