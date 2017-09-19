package com.oa.deskTop.serviceImpl;

import java.util.List;

import com.oa.deskTop.daoImpl.ShortmessageDaoImpl;
import com.oa.deskTop.entity.Shortmessage;
import com.oa.deskTop.service.ShortmessageService;
import com.oa.personnel.entity.UserInfo;

public class ShortmessageServiceImpl implements ShortmessageService {

	private ShortmessageDaoImpl shortmessageDaoImpl=new ShortmessageDaoImpl();
	/**
	 * 查看收件箱收到的信息
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceive(UserInfo userInfo, int pageNo,
			int pageSize) {
		List<Shortmessage> shortmessageList=shortmessageDaoImpl.findByReceiveId(userInfo, pageNo, pageSize);
		return shortmessageList;
	}
	
	 /**
	    * 发送信息
	    * @param message
	    * @return
	    */
	public int send(Shortmessage message) {
		int ret=shortmessageDaoImpl.send(message);
		return ret;
	}


	/**
	 * 查看收到的信息（未分页）
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo) {
		List<Shortmessage> shortmessages=shortmessageDaoImpl.findReceive(userInfo);
		return shortmessages;
	}
	/**
	 * 查看我发送的信息（未分页）
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findSend(UserInfo userInfo) {
		List<Shortmessage> shortmessages=shortmessageDaoImpl.findSend(userInfo);
		return shortmessages;
	}

	 /**
     * 修改已读
     */
	public int updateRead(int messageId) {
	   int ret=	shortmessageDaoImpl.updateRead(messageId);
		return ret;
	}

	 /**
     * 根据id查询
     */
	public Shortmessage findById(int MegId) {
		Shortmessage shortmessage=shortmessageDaoImpl.findById(MegId);
		return shortmessage;
	}

	/**
	 * 查询模糊用户的邮箱
	 */
	public List<String> findLike(String str) {
		 List<String> emailList=shortmessageDaoImpl.findLike(str);
		return emailList;
	}

	/**
	 * 查询未读消息
	 */
	public List<Shortmessage> findUnRead(UserInfo recUser) {
		List<Shortmessage> unshortmessages=	shortmessageDaoImpl.findUnRead(recUser);
		return unshortmessages;
	}
	/**
	 * 删除短消息
	 */
	public int deleteMsg(int msgId) {
		int ret=shortmessageDaoImpl.delete(msgId);
		return ret;
	}

}
