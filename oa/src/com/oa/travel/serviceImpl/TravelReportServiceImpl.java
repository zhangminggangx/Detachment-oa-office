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
	 * 添加新出差报告
	 */
	public int add(TravelReport travelReport) {
		return travelReportDaoImpl.insert(travelReport);
	}

	/**
	 * 根据单号查找报告单
	 */
	public TravelReport searchByFormNo(String FormNo) {
		TravelReport travelReport = travelReportDaoImpl.findByFormNo(FormNo);
		return travelReport;
	}

	/**
	 * 分页查询
	 */
	public List<TravelReport> sreachAll(int pageSize, int pageNo) {
		List<TravelReport> travelReports = new ArrayList<TravelReport>();
		travelReports = travelReportDaoImpl.findAll(pageSize, pageNo);
		return travelReports;
	}

	/**
	 * 查询总页数
	 */
	public int computePageCount(int pageSize) {
		int pageCount = travelReportDaoImpl.computePageCount(pageSize);
		return pageCount;
	}

	/**
	 * 更新
	 */
	public int update(int reportId, TravelReport newReport) {
		int ret = travelReportDaoImpl.update(reportId, newReport);
		return ret;
	}

	/**
	 * 查询我审核的报告单
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
	 * 修改报告单状态
	 */

	public int updateReportState(int reportId, int newState) {
		int ret = travelReportDaoImpl.updateReportState(reportId, newState);
		return ret;
	}
	/*
	 * 查询
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
		    * 各状态分页
		    */
		public int computePageCountByState(int pageSize, int state) {
			return travelReportDaoImpl.computePageCountByState(pageSize, state);
		}
		/**
		 * 删除
		 * @param repId
		 * @return
		 */
		public int delete(int repId) {
			int ret=travelReportDaoImpl.delete(repId);
			return ret;
		}



}
