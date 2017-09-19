package com.oa.documents.serviceImpl;

import java.util.List;

import com.oa.documents.daoImpl.AppendixDaoImpl;
import com.oa.documents.entity.Appendix;
import com.oa.documents.service.AppendixService;

public class AppendixServiceImpl implements AppendixService {

	private AppendixDaoImpl appendDaoImpl=new AppendixDaoImpl();
	public int add(Appendix appendix) {
		return appendDaoImpl.insert(appendix);
	}
	public List<Appendix> searchByDocId(int docId) {
		List<Appendix> appendixs=appendDaoImpl.findByDocId(docId);
		
		return appendixs;
	}
	public Appendix searchById(int appendId) {
		return appendDaoImpl.findById(appendId);
	}

}
