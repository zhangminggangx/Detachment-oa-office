package com.oa.personnel.dao;

public interface FormNoDao {
	public int findEmpNo();
	public int findDisNo();
	public int findAppNo();
	public int findReportNo();
	
	public int updateEmpNo(int empNo);
	public int updateDisNo(int disNo);

	public int updateAppNo(int appNo);

	public int updateReportNo(int reportNo);


}
