package com.oa.deskTop.service;

import java.util.List;

import com.oa.deskTop.entity.Shortmessage;
import com.oa.personnel.entity.UserInfo;

public interface ShortmessageService {
	/**
	 * 查看收到的信息
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceive(UserInfo userInfo, int pageNo,
			int pageSize);
	
	/**
	 * 查看收到的信息（未分页）
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo);
	
	/**
	 * 查看我发送的信息（未分页）
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
	     * 修改已读
	     */
		public int updateRead(int messageId);
		 /**
	     * 根据id查询
	     */
		public Shortmessage findById(int MegId);
		/**
		 * 查询模糊用户的邮箱
		 */

		public List<String> findLike(String str);
		/**
		 * 查询未读消息
		 */
		public List<Shortmessage> findUnRead(UserInfo recUser);
		/**
		 * 删除短消息
		 */
		int deleteMsg(int msgId);
}
