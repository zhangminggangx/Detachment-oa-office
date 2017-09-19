package com.oa.deskTop.dao;

import java.util.List;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.personnel.entity.UserInfo;


public interface ShortmessageDao {
	/**
	 * 查看收到的信息（分页）
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceiveId(UserInfo userInfo , int pageNo, int pageSize);
	/**
	 * 查看收到的信息（未分页）
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo);
	/**
	 * 查看发送的信息（未分页）
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findSend(UserInfo userInfo);
   /**
    * 发送信息
    * @param message
    * @return
    */
    int send(Shortmessage message);
    /**
     * 删除收到的信息
     * @param messageId
     * @return
     */
     int delete(int messageId);
    /**
     * 计算数量
     */
    int computerCount(int pageSize,UserInfo users);
    /**
     * 修改已读
     */
    int updateRead(int messageId);
    /**
     * 根据id查询
     */
    Shortmessage findById(int MegId);
    /**
     * 查询模糊用户的邮箱
     */
    List<String> findLike(String str);
    /**
	 * 查询未读消息
	 */
	public List<Shortmessage> findUnRead(UserInfo recUser);
}
