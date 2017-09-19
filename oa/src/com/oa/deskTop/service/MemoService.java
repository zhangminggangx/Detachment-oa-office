package com.oa.deskTop.service;

import java.util.List;

import net.sf.json.JSONObject;

import com.oa.deskTop.entity.Memo;

public interface MemoService {
	public List<Memo> searchAll(int pageSize, int pageNo, int uId);

	public int computePageCount(int pageSize, int uId);
	public JSONObject add(Memo memo);
	public int delete(int memoId);
	public Memo searchById(int id);
	public int modify(Memo memo);
}
