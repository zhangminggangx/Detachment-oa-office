package com.oa.personnel.serviceImpl;

import com.oa.personnel.dao.FormNoDao;
import com.oa.personnel.daoImpl.FormNoDaoImpl;
import com.oa.personnel.service.FormNoService;

public class FormNoServiceImpl implements FormNoService {
	private FormNoDao formDao = new FormNoDaoImpl();
	public int searchAppNo() {
		int appNo = formDao.findAppNo();
		return appNo;
	}

	public int searchDisNo() {
		int disNo = formDao.findDisNo();
		return disNo;
	}

	public int searchEmpNo() {
		int empNo = formDao.findEmpNo();
		return empNo;
	}

	public int searchReportNo() {
		int reportNo = formDao.findReportNo();
		return reportNo;
	}

	public int updateAppNo(int appNo) {
		int ret = formDao.updateAppNo(appNo);
		return ret;
		
	}

	public int updateDisNo(int disNo) {
		int ret = formDao.updateDisNo(disNo);
		return ret;
	}

	public int updateEmpNo(int empNo) {
		int ret = formDao.updateEmpNo(empNo);
		return ret;
	}

	public int updateReportNo(int reportNo) {
		int ret = formDao.updateReportNo(reportNo);
		return ret;
	}

}
