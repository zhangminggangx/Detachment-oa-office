package com.oa.travel.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.oa.travel.daoImpl.TravelReportDaoImpl;
import com.oa.travel.entity.TravelReport;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.service.TravelReportService;

public class TravelReportServiceImpl implements TravelReportService {
	TravelReportDaoImpl travelReportDaoImpl = new TravelReportDaoImpl();

	/**
	 * ����³����
	 */
	public int add(TravelReport travelReport) {
		return travelReportDaoImpl.insert(travelReport);
	}

	/**
	 * ���ݵ��Ų��ұ��浥
	 */
	public TravelReport searchByFormNo(String FormNo) {
		TravelReport travelReport = travelReportDaoImpl.findByFormNo(FormNo);
		return travelReport;
	}

	/**
	 * ��ҳ��ѯ
	 */
	public List<TravelReport> sreachAll(int pageSize, int pageNo) {
		List<TravelReport> travelReports = new ArrayList<TravelReport>();
		travelReports = travelReportDaoImpl.findAll(pageSize, pageNo);
		return travelReports;
	}

	/**
	 * ��ѯ��ҳ��
	 */
	public int computePageCount(int pageSize) {
		int pageCount = travelReportDaoImpl.computePageCount(pageSize);
		return pageCount;
	}

	/**
	 * ����
	 */
	public int update(int reportId, TravelReport newReport) {
		int ret = travelReportDaoImpl.update(reportId, newReport);
		return ret;
	}

	/**
	 * ��ѯ����˵ı��浥
	 */
	public List<TravelReport> searchApproveReport(
			List<WorkStream> workStreamsList) {
		List<TravelReport> travelReportsList = new ArrayList<TravelReport>();
		List<TravelReport> bgTReports = new ArrayList<TravelReport>();
		for (int i = 0; i < workStreamsList.size(); i++) {
			if (workStreamsList.get(i).getFormNo().substring(0, 2).equals("BG")) {
				TravelReport travelReport = new TravelReport();
				String bgFormNo = workStreamsList.get(i).getFormNo();
				travelReport = travelReportDaoImpl.findByFormNo(bgFormNo);
				travelReport.setWsId(workStreamsList.get(i).getWsId());
				bgTReports.add(travelReport);
				// travelReportsList.add(travelReport);
			}
		}
		return bgTReports;
	}

	/**
	 * �޸ı��浥״̬
	 */

	public int updateReportState(int reportId, int newState) {
		int ret = travelReportDaoImpl.updateReportState(reportId, newState);
		return ret;
	}
	/*
	 * ��ѯ
	 * */
		public List<TravelReport> searchByEmpIdAndState(int empId, int state) {
			return travelReportDaoImpl.findByState(empId, state);
		}

		public List<TravelReport> searchByEmpIdAndState(int empId, int state,
				int pageSize, int pageNo) {
			return travelReportDaoImpl.findByState(empId, state, pageSize, pageNo);
		}

		 /**
		    * 
		    * ��״̬��ҳ
		    */
		public int computePageCountByState(int pageSize, int state) {
			return travelReportDaoImpl.computePageCountByState(pageSize, state);
		}
		/**
		 * ɾ��
		 * @param repId
		 * @return
		 */
		public int delete(int repId) {
			int ret=travelReportDaoImpl.delete(repId);
			return ret;
		}



}
