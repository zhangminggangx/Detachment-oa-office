package com.oa.documents.dao;

import com.oa.documents.entity.Directory;

public interface DirectoryDao {
	public int insert(Directory directory);
	public int delete(int dirId);
	public String findByParentId(int parentId);
	
	
}
