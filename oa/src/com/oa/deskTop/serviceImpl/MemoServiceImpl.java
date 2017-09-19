package com.oa.deskTop.serviceImpl;

import java.util.List;

import net.sf.json.JSONObject;

import com.oa.deskTop.daoImpl.MemoDaoImpl;
import com.oa.deskTop.entity.Memo;
import com.oa.deskTop.service.MemoService;
import com.oa.personnel.daoImpl.UserInfoDaoImpl;
import com.oa.personnel.entity.UserInfo;

public class MemoServiceImpl implements MemoService {
	private MemoDaoImpl memoImpl = new MemoDaoImpl();
	private UserInfoDaoImpl userImpl = new UserInfoDaoImpl();

	public List<Memo> searchAll(int pageSize, int pageNo, int uId) {
		List<Memo> memoList = memoImpl.findAll(pageSize, pageNo, uId);
		// System.out.println(memoList.size());
		for (Memo m : memoList) {
			// System.out.println(m.getTitle());
			m.setUserInfo(userImpl.findById(uId));
		}
		return memoList;
	}

	public int computePageCount(int pageSize, int uId) {
		return memoImpl.computePageCount(pageSize, uId);
	}

	/*
	 * Ôö¼Ó±ãÇ© (non-Javadoc)
	 * 
	 * @see com.oa.deskTop.service.MemoService#add(com.oa.deskTop.entity.Memo)
	 */
	public JSONObject add(Memo memo) {
		int ret = memoImpl.insert(memo);
		if (ret != 0) {
			UserInfo u = userImpl.findById(memo.getUid());
			memo.setUserInfo(u);
		}
		JSONObject json = JSONObject.fromObject(memo);
		return json;
	}

	public int delete(int memoId) {
		return memoImpl.delete(memoId);
	}

	public Memo searchById(int id) {
		Memo memo = memoImpl.findByMemoId(id);
		memo.setUserInfo(userImpl.findById(memo.getUid()));
		return memo;
	}
	public int modify(Memo memo){
		return memoImpl.update(memo);
	}

}
