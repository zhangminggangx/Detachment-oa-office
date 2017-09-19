package com.oa.personnel.service;

public interface FormNoService {
	public int searchEmpNo();
	public int searchDisNo();
	public int searchAppNo();
	public int searchReportNo();
	
	public int updateEmpNo(int empNo);
	public int updateDisNo(int disNo);

	public int updateAppNo(int appNo);

	public int updateReportNo(int reportNo);


}
