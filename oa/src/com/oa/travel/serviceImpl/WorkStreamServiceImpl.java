package com.oa.travel.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.oa.dispatch.dao.DispatchDao;
import com.oa.dispatch.daoImpl.DispatchDaoImpl;
import com.oa.dispatch.entity.Dispatch;
import com.oa.personnel.dao.EmployeeDao;
import com.oa.personnel.daoImpl.EmployeeDaoImpl;
import com.oa.personnel.entity.Employee;
import com.oa.travel.dao.ApproveResultDao;
import com.oa.travel.daoImpl.ApproveResultImpl;
import com.oa.travel.daoImpl.WorkStreamDaoImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.service.WorkStreamService;

public class WorkStreamServiceImpl implements WorkStreamService {

	private DispatchDao disImpl = new DispatchDaoImpl();
	private EmployeeDao empImpl = new EmployeeDaoImpl();
	private WorkStreamDaoImpl impl = new WorkStreamDaoImpl();

	private ApproveResultDao appResultImpl = new ApproveResultImpl();

	/**
	 * 查询已审核报告单流程
	 */
	public List<WorkStream> findReportedByBossId(int empId, int pageSize,
			int pageNo) {

		List<WorkStream> wsListAll = impl.findApprovedDis(empId, pageSize,
				pageNo);
		List<WorkStream> workStreamBG = new ArrayList<WorkStream>();
		for (WorkStream workStream : wsListAll) {
			if (workStream.getFormNo().substring(0, 2).equals("BG")) {

				ApproveResult appResult = appResultImpl.finByWsId(workStream
						.getWsId());
				workStream.setAppResult(appResult);
				workStreamBG.add(workStream);

			}
		}
		return workStreamBG;
	}

	/**
	 * 查询报告单流程
	 */
	public List<WorkStream> findReportByBossId(int empId, int pageSize,
			int pageNo) {
		List<WorkStream> wsList = impl.findByBossId(empId, pageSize, pageNo);
		return wsList;
	}
	
	/**
	 * 查询已审核出差申请单流程
	 */
	public List<WorkStream> findAppedByBossId(int empId, int pageSize,
			int pageNo) {

		List<WorkStream> wsListAll = impl.findApprovedDis(empId, pageSize,
				pageNo);
		List<WorkStream> workStreamBG = new ArrayList<WorkStream>();
		for (WorkStream workStream : wsListAll) {
			if (workStream.getFormNo().substring(0, 2).equals("SQ")) {

				ApproveResult appResult = appResultImpl.finByWsId(workStream
						.getWsId());
				workStream.setAppResult(appResult);
				workStreamBG.add(workStream);

			}
		}
		return workStreamBG;
	}
	/**
	 * 查询出差查询流程
	 */
	public List<WorkStream> findAppByBossId(int empId, int pageSize,
			int pageNo) {
		List<WorkStream> wsList = impl.findByBossId(empId, pageSize, pageNo);
		return wsList;
	}


	public int add(WorkStream ws) {
		return impl.insert(ws);
	}

	public List<WorkStream> findByBossId(int id, int pageSize, int pageNo) {
		List<WorkStream> workStreams =impl.findByBossId(id, pageSize, pageNo);
		List<WorkStream> wsl = new ArrayList<WorkStream>();
		for (WorkStream workStream : workStreams) {
			if(("BX").equals(workStream.getFormNo().substring(0, 2))){
				wsl.add(workStream);
			}
		}
		return wsl;
	}

	public WorkStream findById(int wsId) {
		return impl.findById(wsId);
	}

	public WorkStream findByFormNo(String formNo) {
		return impl.findByFormNo(formNo);
	}

	public int updateHasApproved(int wsId) {
		return impl.updateHasApproved(wsId);
	}

	public List<WorkStream> searchApprovedDis(int empId, int pageSize,int pageNo) {
		List<WorkStream> wsList = impl.findApprovedDis(empId, pageSize, pageNo);
		List<WorkStream> list=new ArrayList<WorkStream>();
		for (WorkStream workStream : wsList) {
			String formNo = workStream.getFormNo();
			String str = formNo.substring(0, 2);
			if (str.equals("BX")) {
				Dispatch dispatch = disImpl.findByFormNo(formNo);
				ApproveResult appResult = appResultImpl.finByWsId(workStream.getWsId());

				Employee emp = empImpl.findById(dispatch.getEmpId());

				dispatch.setEmployee(emp);
				workStream.setDispatch(dispatch);
				workStream.setAppResult(appResult);
				list.add(workStream);
			}
		}
		return list;
	}

	public int computePageCount(int id, int pageSize, boolean hasApproved) {
		return impl.computePageCount(id, pageSize, hasApproved);
	}
	public int computePageCount(int id, int pageSize,boolean hasApproved,String likeFormNo){
		return impl.computePageCount(id, pageSize, hasApproved, likeFormNo);
		
	}

}
