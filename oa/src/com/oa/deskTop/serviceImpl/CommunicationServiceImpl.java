package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.dao.CommunicationDao;
import com.oa.deskTop.daoImpl.CommunicationDaoImpl;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.service.CommunicationService;

public class CommunicationServiceImpl implements CommunicationService {
	/**
	 * 分页查找所有通讯录
	 */
	private CommunicationDao commDao = new CommunicationDaoImpl();
	public List<Communication> serachAll(int pageNo, int pageSize) {
		return commDao.findAll( pageNo,pageSize);
	}
	/**
	 * 计算通讯录的最大页数
	 */
	public int computPageCount(int pageSize) {
		return commDao.computePageCount(pageSize);
	}
	/**
	 * 查找所有通讯录
	 */
	public List<Communication> serachAll() {
			return commDao.findAll();
	}
	/**
	 * 按条件查找
	 */
	public List<Communication> SearchByCondition(String empName,
			String department, String position, String empMobile) {
		return commDao.findByCondition(empName, department, position, empMobile);
	}
	public int addCommunication(Communication comm) {
		return commDao.insert(comm);
	}
	public int updateComm(Communication comm) {
		int ret=commDao.updateComm(comm);
		return ret;
	}
	public Communication findById(int commId) {
		Communication communication=	commDao.findByCommId(commId);
		return communication;
	}

}
