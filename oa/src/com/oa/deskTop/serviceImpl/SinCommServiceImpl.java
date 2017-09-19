package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.dao.CommunicationDao;
import com.oa.deskTop.dao.SinCommDao;
import com.oa.deskTop.daoImpl.CommunicationDaoImpl;
import com.oa.deskTop.daoImpl.SinCommDaoImpl;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.entity.SinComm;
import com.oa.deskTop.service.SinCommService;

public class SinCommServiceImpl implements SinCommService {
	private SinCommDao sinDao = new SinCommDaoImpl();
	private CommunicationDao commDao = new CommunicationDaoImpl();
	private SinCommDao sinCommDao = new SinCommDaoImpl();
	/**
	 * 查找所有个人通讯录的信息
	 */
	public List<SinComm> searchAllSinComm(int pageNo, int pageSize, int uId) {
		List<SinComm> sinList = sinDao.findAll(pageNo, pageSize, uId);
		for (SinComm sinComm : sinList) {
			Communication comm = commDao.findByCommId(sinComm.getCommId());
			sinComm.setComm(comm);
		}
		return sinList;
	}
	public int AddSinComm(SinComm sinComm) {
		return sinDao.insert(sinComm);
	}
	public int removeSinComm(int commId) {
		return sinCommDao.delete(commId);
	}
	public List<SinComm> searchAllSinComm(int uId) {
		List<SinComm> sinList = sinDao.findAll(uId);
		for (SinComm sinComm : sinList) {
			Communication comm = commDao.findByCommId(sinComm.getCommId());
			sinComm.setComm(comm);
		}
		return sinList;
	}
	
	public List<SinComm> searchAllSinComm(int uId, int typeId) {
		List<SinComm> sinList = sinDao.findByTypeId(uId, typeId);
		for (SinComm sinComm : sinList) {
			Communication comm = commDao.findByCommId(sinComm.getCommId());
			sinComm.setComm(comm);
		}
		return sinList;
	}
}
