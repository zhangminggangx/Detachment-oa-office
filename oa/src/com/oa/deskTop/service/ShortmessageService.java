package com.oa.deskTop.service;

import java.util.List;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.personnel.entity.UserInfo;

public interface ShortmessageService {
	/**
	 * �鿴�յ�����Ϣ
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceive(UserInfo userInfo, int pageNo,
			int pageSize);
	
	/**
	 * �鿴�յ�����Ϣ��δ��ҳ��
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo);
	
	/**
	 * �鿴�ҷ��͵���Ϣ��δ��ҳ��
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findSend(UserInfo userInfo);
	
	 /**
	    * ������Ϣ
	    * @param message
	    * @return
	    */
	    int send(Shortmessage message);
	    /**
	     * �޸��Ѷ�
	     */
		public int updateRead(int messageId);
		 /**
	     * ����id��ѯ
	     */
		public Shortmessage findById(int MegId);
		/**
		 * ��ѯģ���û�������
		 */

		public List<String> findLike(String str);
		/**
		 * ��ѯδ����Ϣ
		 */
		public List<Shortmessage> findUnRead(UserInfo recUser);
		/**
		 * ɾ������Ϣ
		 */
		int deleteMsg(int msgId);
}
