package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.daoImpl.ShortmessageDaoImpl;
import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.service.ShortmessageService;
import com.oa.personnel.entity.UserInfo;

public class ShortmessageServiceImpl implements ShortmessageService {

	private ShortmessageDaoImpl shortmessageDaoImpl=new ShortmessageDaoImpl();
	/**
	 * �鿴�ռ����յ�����Ϣ
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceive(UserInfo userInfo, int pageNo,
			int pageSize) {
		List<Shortmessage> shortmessageList=shortmessageDaoImpl.findByReceiveId(userInfo, pageNo, pageSize);
		return shortmessageList;
	}
	
	 /**
	    * ������Ϣ
	    * @param message
	    * @return
	    */
	public int send(Shortmessage message) {
		int ret=shortmessageDaoImpl.send(message);
		return ret;
	}


	/**
	 * �鿴�յ�����Ϣ��δ��ҳ��
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo) {
		List<Shortmessage> shortmessages=shortmessageDaoImpl.findReceive(userInfo);
		return shortmessages;
	}
	/**
	 * �鿴�ҷ��͵���Ϣ��δ��ҳ��
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findSend(UserInfo userInfo) {
		List<Shortmessage> shortmessages=shortmessageDaoImpl.findSend(userInfo);
		return shortmessages;
	}

	 /**
     * �޸��Ѷ�
     */
	public int updateRead(int messageId) {
	   int ret=	shortmessageDaoImpl.updateRead(messageId);
		return ret;
	}

	 /**
     * ����id��ѯ
     */
	public Shortmessage findById(int MegId) {
		Shortmessage shortmessage=shortmessageDaoImpl.findById(MegId);
		return shortmessage;
	}

	/**
	 * ��ѯģ���û�������
	 */
	public List<String> findLike(String str) {
		 List<String> emailList=shortmessageDaoImpl.findLike(str);
		return emailList;
	}

	/**
	 * ��ѯδ����Ϣ
	 */
	public List<Shortmessage> findUnRead(UserInfo recUser) {
		List<Shortmessage> unshortmessages=	shortmessageDaoImpl.findUnRead(recUser);
		return unshortmessages;
	}
	/**
	 * ɾ������Ϣ
	 */
	public int deleteMsg(int msgId) {
		int ret=shortmessageDaoImpl.delete(msgId);
		return ret;
	}

}
