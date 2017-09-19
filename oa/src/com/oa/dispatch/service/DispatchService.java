package com.oa.dispatch.service;

import java.util.List;

import com.oa.dispatch.entity.DisDetail;
import com.oa.dispatch.entity.Dispatch;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.WorkStream;

public interface DispatchService {
	public List<Dispatch> searchEmpStateDis(int empId,int state,int pageSize,int pageNo);
	public List<Dispatch> searchEmpDis(int empId,int pageSize,int pageNo);
	public int computePageCount(int pageSize,int empId,int state);
	public int computePageCount(int pageSize,int empId);
	
	public List<Dispatch> searchEmpDis(int empId);
	public List<Dispatch> searchEmpStateDis(int empId ,int state);
	
	public Dispatch searchFormNoDis(String formNo);
	
	public Dispatch searchDisDetail(String formNo);
	
	public int findMaxId();
	public int submitDis(String formNo,int state,String position);
	
	public int approveDis(ApproveResult ar, int wsId, WorkStream newWs,int state);
	public int approveDis(ApproveResult ar, int wsId) ;
	public int update(Dispatch dis,List<DisDetail> details);
	
	
	public int removeDis(String formNo);
	public int add(Dispatch dis, List<DisDetail> details, WorkStream newWs);
	public int add(Dispatch dis, List<DisDetail> details);
}
