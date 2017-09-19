package com.oa.deskTop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.deskTop.dao.ShortmessageDao;
import com.oa.deskTop.entity.Shortmessage;
import com.oa.personnel.entity.UserInfo;

public class ShortmessageDaoImpl extends BaseDao implements ShortmessageDao {

	/**
	 * 查看收到的信息(分页)
	 * 
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findByReceiveId(UserInfo userInfo, int pageNo,
			int pageSize) {

		String sql = "select top " + pageSize
				+ " * from Shortmessage where receiveEmail="
				+ userInfo.getComEmail() + " and id not in (select top "
				+ ((pageNo - 1) * pageSize)
				+ " id from messages where receiveEmail="
				+ userInfo.getComEmail()
				+ " order by sendTime ) order by messageId desc";

		ResultSet rs = super.executeQuery(sql, userInfo.getUid());
		List<Shortmessage> messagesList = new ArrayList<Shortmessage>();
		try {
			while (rs.next()) {
				Shortmessage tempMsg = new Shortmessage();

				tempMsg.setContents(rs.getString("contents"));
				tempMsg.setMessageId(rs.getInt("messageId"));
				tempMsg.setTitle(rs.getString("title"));
				tempMsg.setSendEmail(rs.getString("sendEmail"));
				tempMsg.setSendTime(rs.getDate("sendTime"));
				tempMsg.setUnread(rs.getBoolean("unread"));
				tempMsg.setReceiveEmail(userInfo.getComEmail());

				messagesList.add(tempMsg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return messagesList;
	}

	/**
	 * 查看收到的信息（未分页）
	 * 
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findReceive(UserInfo userInfo) {
		//System.out.println(userInfo.getComEmail());
		String sql = "select * from Shortmessage where receiveEmail='"
				+ userInfo.getComEmail() + "' order by messageId desc";
		ResultSet rs = super.executeQuery(sql);
		List<Shortmessage> messagesList = new ArrayList<Shortmessage>();
		try {
			while (rs.next()) {
				Shortmessage tempMsg = new Shortmessage();

				tempMsg.setContents(rs.getString("contents"));
				tempMsg.setMessageId(rs.getInt("messageId"));
				tempMsg.setTitle(rs.getString("title"));
				tempMsg.setSendEmail(rs.getString("sendEmail"));
				tempMsg.setSendTime(rs.getDate("sendTime"));
				tempMsg.setUnread(rs.getBoolean("unread"));
				tempMsg.setReceiveEmail(userInfo.getComEmail());

				messagesList.add(tempMsg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return messagesList;
	}

	/**
	 * 发送信息
	 * 
	 * @param message
	 * @return
	 */
	public int send(Shortmessage message) {
		String sql = "insert into Shortmessage values(?,?,?,?,?,?)";
		List params = new ArrayList();
		params.add(message.getTitle());
		params.add(message.getContents());
		params.add(message.getSendTime());
		params.add(message.getSendEmail());
		params.add(message.getReceiveEmail());
		params.add(message.isUnread());
		int ret = super.executeUpdate(sql, params);
		super.close();
		return ret;
	}

	/**
	 * 删除收到的信息
	 * 
	 * @param messageId
	 * @return
	 */
	public int delete(int messageId) {
		String sql = "delete from Shortmessage where messageId=?";
		int ret = super.executeUpdate(sql, messageId);
		super.close();
		return ret;
	}

	/**
	 * 计算总页数
	 */
	public int computerCount(int pageSize, UserInfo users) {
		String sql = "select count(receiverId) as 'sum' from Shortmessage where receiveId=?";

		ResultSet rs = super.executeQuery(sql, users.getUid());
		int sum = 0;
		try {
			if (rs.next()) {
				sum = rs.getInt("sum");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum % pageSize == 0 ? sum / pageSize : sum / pageSize + 1;
	}

	/**
	 * 查看我发送的信息（未分页）
	 * 
	 * @param userId
	 * @return
	 */
	public List<Shortmessage> findSend(UserInfo userInfo) {
		String sql = "select * from Shortmessage where sendEmail='"
				+ userInfo.getComEmail() + "' order by messageId desc";
		ResultSet rs = super.executeQuery(sql);
		List<Shortmessage> messagesList = new ArrayList<Shortmessage>();
		try {
			while (rs.next()) {
				Shortmessage tempMsg = new Shortmessage();

				tempMsg.setContents(rs.getString("contents"));
				tempMsg.setMessageId(rs.getInt("messageId"));
				tempMsg.setTitle(rs.getString("title"));
				tempMsg.setSendEmail(userInfo.getComEmail());
				tempMsg.setSendTime(rs.getDate("sendTime"));
				tempMsg.setUnread(rs.getBoolean("unread"));
				tempMsg.setReceiveEmail(rs.getString("receiveEmail"));

				messagesList.add(tempMsg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return messagesList;
	}

	/**
	 * 修改已读
	 */
	public int updateRead(int messageId) {
		String sql = "update Shortmessage set unread='false' where messageId=?";
		int ret = super.executeUpdate(sql, messageId);
		return ret;
	}

	/**
	 * 根据id查询
	 */
	public Shortmessage findById(int MegId) {
		String sql = "select * from Shortmessage where messageId=?";
		ResultSet rs = super.executeQuery(sql, MegId);
		Shortmessage tempMsg = null;
		try {
			if (rs.next()) {
				tempMsg = new Shortmessage();

				tempMsg.setContents(rs.getString("contents"));
				tempMsg.setMessageId(rs.getInt("messageId"));
				tempMsg.setTitle(rs.getString("title"));
				tempMsg.setSendEmail(rs.getString("sendEmail"));
				tempMsg.setSendTime(rs.getDate("sendTime"));
				tempMsg.setUnread(rs.getBoolean("unread"));
				tempMsg.setReceiveEmail(rs.getString("receiveEmail"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return tempMsg;
	}

	/**
	 * 查询模糊用户的邮箱
	 */

	public List<String> findLike(String str) {
		String sql = "select comEmail from userInfo where comEmail like '%"
				+ str + "%'";
		ResultSet rs = super.executeQuery(sql);
		List<String> stringList = new ArrayList<String>();
		try {
			while (rs.next()) {
				String temp = null;
				temp = rs.getString("comEmail");
				stringList.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return stringList;
	}

	/**
	 * 查询未读消息
	 */
	public List<Shortmessage> findUnRead(UserInfo recUser) {
		String sql = "select * from Shortmessage where unread='True' and receiveEmail='"
				+ recUser.getComEmail() + "'";
		ResultSet rs = super.executeQuery(sql);
		List<Shortmessage> messagesList = new ArrayList<Shortmessage>();
		try {
			while (rs.next()) {
				Shortmessage tempMsg = new Shortmessage();

				tempMsg.setContents(rs.getString("contents"));
				tempMsg.setMessageId(rs.getInt("messageId"));
				tempMsg.setTitle(rs.getString("title"));
				tempMsg.setSendEmail(rs.getString("sendEmail"));
				tempMsg.setSendTime(rs.getDate("sendTime"));
				tempMsg.setUnread(rs.getBoolean("unread"));
				tempMsg.setReceiveEmail(recUser.getComEmail());

				messagesList.add(tempMsg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return messagesList;
	}

}
