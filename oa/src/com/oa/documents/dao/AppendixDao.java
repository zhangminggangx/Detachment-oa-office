package com.oa.documents.dao;

import java.util.List;

import com.oa.documents.entity.Appendix;

public interface AppendixDao {
	public int insert(Appendix appendix);
	public int delete(int docId);
	public List<Appendix> findByDocId(int docId);
	public Appendix findById(int appendId);

}
