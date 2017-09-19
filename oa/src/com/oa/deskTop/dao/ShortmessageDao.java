package com.oa.deskTop.dao;

import java.util.List;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.personnel.entity.UserInfo;


public interface ShortmessageDao {
	/**
	 * �鿴�յ�����Ϣ����ҳ��
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceiveId(UserInfo userInfo , int pageNo, int pageSize);
	/**
	 * �鿴�յ�����Ϣ��δ��ҳ��
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo);
	/**
	 * �鿴���͵���Ϣ��δ��ҳ��
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
     * ɾ���յ�����Ϣ
     * @param messageId
     * @return
     */
     int delete(int messageId);
    /**
     * ��������
     */
    int computerCount(int pageSize,UserInfo users);
    /**
     * �޸��Ѷ�
     */
    int updateRead(int messageId);
    /**
     * ����id��ѯ
     */
    Shortmessage findById(int MegId);
    /**
     * ��ѯģ���û�������
     */
    List<String> findLike(String str);
    /**
	 * ��ѯδ����Ϣ
	 */
	public List<Shortmessage> findUnRead(UserInfo recUser);
}
