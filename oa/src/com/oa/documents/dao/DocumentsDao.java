package com.oa.documents.dao;

import java.util.List;

import com.oa.documents.entity.Documents;

public interface DocumentsDao {
	public int insert(Documents documents);
	public int delete (int docId);
	public List<Documents> findByUid(int uId);
	public int findMaxId();
	public List<Documents> findByCondition(int uId,String title,String note);
	
}
