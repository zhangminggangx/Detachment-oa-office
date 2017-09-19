package com.oa.dispatch.serviceImpl;

import java.util.List;

import com.oa.dispatch.dao.DisDetailDao;
import com.oa.dispatch.dao.DispatchDao;
import com.oa.dispatch.daoImpl.DisDetailDaoImpl;
import com.oa.dispatch.daoImpl.DispatchDaoImpl;
import com.oa.dispatch.entity.DisDetail;
import com.oa.dispatch.entity.Dispatch;
import com.oa.dispatch.service.DispatchService;
import com.oa.personnel.dao.EmployeeDao;
import com.oa.personnel.daoImpl.EmployeeDaoImpl;
import com.oa.personnel.entity.Employee;
import com.oa.travel.dao.WorkStreamDao;
import com.oa.travel.daoImpl.ApproveResultImpl;
import com.oa.travel.daoImpl.WorkStreamDaoImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.WorkStream;

public class DispatchServiceImpl implements DispatchService {
	private DispatchDao disDao = new DispatchDaoImpl();
	private DisDetailDao detailDao = new DisDetailDaoImpl();
	private WorkStreamDao wsDao = new WorkStreamDaoImpl();
	private EmployeeDao empDao = new EmployeeDaoImpl();
	private ApproveResultImpl arImpl=new ApproveResultImpl();
	/**
	 * 分页查找员工的所有报销单
	 */
	public List<Dispatch> searchEmpDis(int empId, int pageSize, int pageNo) {
		List<Dispatch> disList = disDao.findByEmpId(empId, pageSize, pageNo);
		return disList;
	}
	/**
	 * 分页查找员工某种状态的报销单
	 */
	public List<Dispatch> searchEmpStateDis(int empId, int state, int pageSize,
			int pageNo) {
		List<Dispatch> disList = disDao.findByEmpId(empId, state, pageSize, pageNo);
		return disList;
	}
	/**
	 * 计算查找员工的所有报销单时的最大页数
	 */
	public int computePageCount(int pageSize, int empId, int state) {
		int pageCount = disDao.computePageCount(pageSize, empId, state);
		return pageCount;
	}
	/**
	 * 计算查找员工某种状态的报销单时的最大页数
	 */
	public int computePageCount(int pageSize, int empId) {
		int pageCount = disDao.computePageCount(pageSize, empId);
		
		return pageCount;
	}
	/**
	 * 查找员工的所有报销单
	 */
	public List<Dispatch> searchEmpDis(int empId) {
		List<Dispatch> disList = disDao.findByEmpId(empId);
		return disList;
	}
	/**
	 * 查找员工的某种状态的所有报销单
	 */
	public List<Dispatch> searchEmpStateDis(int empId,int state) {
		List<Dispatch> disList = disDao.findByEmpId(empId,state);
		return disList;
	}
	/**
	 * 查找某个单据的详细信息
	 */
	public Dispatch searchFormNoDis(String formNo) {
		Dispatch dispatch = disDao.findByFormNo(formNo);
		return dispatch;
	}
	/**
	 * 查找单据以及单据的详情
	 */
	public Dispatch searchDisDetail(String formNo) {
		Dispatch dispatch = disDao.findByFormNo(formNo);
		List<DisDetail> disDetailList = detailDao.findAll(dispatch.getDisId());
		dispatch.setDisDetailList(disDetailList);
		return dispatch;
	}
	/**
	 * 查找最大的Id
	 */
	public int findMaxId() {
		return disDao.findMaxId();
	}
	/**
		 * 提交未提交的报销单
		 */
		public int submitDis(String formNo, int state,String position) {
			Dispatch dispatch = disDao.findByFormNo(formNo);
			Employee emp=empDao.findByDeptId(dispatch.getDeptId(), position);
			int toId = emp.getEmpId();
			int fromId = dispatch.getEmpId();
			WorkStream ws = new WorkStream();
			ws.setFormNo(formNo);
			ws.setToId(toId);
			ws.setFromId(fromId);
			ws.setHasApproved(false);
			int insRet = wsDao.insert(ws);
			int upRet = disDao.updateState(formNo, state);
			return insRet+upRet;
			
		}
		/*当审核通过时审核所需要实现的操作
		 * (non-Javadoc)
		 * @see com.oa.dispatch.service.DispatchService#approveDis(com.oa.travel.entity.ApproveResult, int, com.oa.travel.entity.WorkStream)
		 */
		public int approveDis(ApproveResult ar, int wsId, WorkStream newWs,int state) {
			String formNo=ar.getFormNo();
			if (wsDao.updateHasApproved(wsId) != 0 && arImpl.insert(ar) != 0
					&& wsDao.insert(newWs) != 0&&disDao.updateState(formNo, state)!=0)
				return 1;
			return 0;
		}
	/*
	 * 审核不通过时的操作(non-Javadoc)
	 * @see com.oa.dispatch.service.DispatchService#approveDis(com.oa.travel.entity.ApproveResult, int, com.oa.travel.entity.WorkStream)
	 */
	public int approveDis(ApproveResult ar, int wsId) {
		WorkStream ws=wsDao.findById(wsId);
		String formNo=ws.getFormNo();
		if(wsDao.updateHasApproved(wsId)!=0&&arImpl.insert(ar)!=0&&disDao.updateState(formNo, 3)!=0)
			return 1;
		return 0;
	}
	public int update(Dispatch dis, List<DisDetail> details) {
		int ret=0;
		
		for(DisDetail detail:details)
		{
		double detailMoney=detail.getDetailMoney();
			if(detailDao.update(detail)==0)
				return 0;
			else
              ret++;
		}
		if(disDao.updateDispatch(dis)==0)
			return 0;
		return ret;
	}
	
	/**
	 * 删除报销单及其明细
	 */
	public int removeDis(String formNo) {
		Dispatch dispatch = disDao.findByFormNo(formNo);
		int disId = dispatch.getDisId();
		int ret1=detailDao.delete(disId);
		int ret2=disDao.delete(disId);
		return ret1+ret2;
	}
	
	
	/*
	 * 保存报销单 (non-Javadoc)
	 * 
	 * @see
	 * com.oa.dispatch.service.DispatchService#add(com.oa.dispatch.entity.Dispatch
	 * , java.util.List)
	 */
	public int add(Dispatch dis, List<DisDetail> details) {
		int ret = 0;
		if (disDao.insert(dis) == 0)
			return 0;
		int disId=disDao.findMaxId();
		for (DisDetail detail : details) {
			// double detailMoney=detail.getDetailMoney();
			detail.setDisId(disId); 
			if (detailDao.insert(detail) == 0)
				return 0;
			else
				ret++;
		}
		
		return ret;
	}
	
	/*
	 * 保存并且提交报销单(non-Javadoc)
	 * 
	 * @see
	 * com.oa.dispatch.service.DispatchService#add(com.oa.dispatch.entity.Dispatch
	 * , java.util.List, com.oa.travel.entity.WorkStream)
	 */
	public int add(Dispatch dis, List<DisDetail> details, WorkStream newWs) {
		int ret = 0;
		if (disDao.insert(dis) == 0||wsDao.insert(newWs)==0)
			return 0;
	    int disId=disDao.findMaxId();
		for (DisDetail detail : details) {
			detail.setDisId(disId);
			// double detailMoney=detail.getDetailMoney();
			if (detailDao.insert(detail) == 0)
				return 0;
			else
				ret++;
		}
		
		return ret;
	}

	
	
	
	
}
