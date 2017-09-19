package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.dao.CommunicationDao;
import com.oa.deskTop.daoImpl.CommunicationDaoImpl;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.service.CommunicationService;

public class CommunicationServiceImpl implements CommunicationService {
	/**
	 * ��ҳ��������ͨѶ¼
	 */
	private CommunicationDao commDao = new CommunicationDaoImpl();
	public List<Communication> serachAll(int pageNo, int pageSize) {
		return commDao.findAll( pageNo,pageSize);
	}
	/**
	 * ����ͨѶ¼�����ҳ��
	 */
	public int computPageCount(int pageSize) {
		return commDao.computePageCount(pageSize);
	}
	/**
	 * ��������ͨѶ¼
	 */
	public List<Communication> serachAll() {
			return commDao.findAll();
	}
	/**
	 * ����������
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
