package com.oa.deskTop.dao;

import java.util.List;

import com.oa.deskTop.entity.Memo;

public interface MemoDao {
	public List<Memo> findAll(int uId);
	public List<Memo> findAll(int pageSize , int pageNo,int uId);
	public int computePageCount(int pageSize,int uId);
	public Memo findByMemoId(int memoId);
	public int insert(Memo memo);
	public int delete(int memoId);
	

}
