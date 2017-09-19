package com.oa.documents.serviceImpl;

import java.util.List;

import com.oa.documents.daoImpl.AppendixDaoImpl;
import com.oa.documents.daoImpl.DocumentsDaoImpl;
import com.oa.documents.entity.Documents;
import com.oa.documents.service.DocumentsService;
import com.oa.personnel.daoImpl.UserInfoDaoImpl;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.serviceImpl.UserInfoServiceImpl;

public class DocumentsServiceImpl implements DocumentsService {

	private DocumentsDaoImpl docuImpl=new DocumentsDaoImpl();
	private AppendixDaoImpl appendixDaoImpl=new AppendixDaoImpl();
	private UserInfoDaoImpl userImpl=new UserInfoDaoImpl();
	public int add(Documents documents) {
		return docuImpl.insert(documents);
	}
	public int findMaxId(){
		return docuImpl.findMaxId();
	}
	public List<Documents> searchAll(int uId) {
		List<Documents> documents=docuImpl.findByUid(uId);
		for(Documents d:documents)
		{
			UserInfo userInfo=userImpl.findById(uId);
		    d.setUserInfo(userInfo);
		}
		return documents;
	}
	public int delete(int docId) {
		if(docuImpl.delete(docId)!=0&&appendixDaoImpl.delete(docId)!=0)
		   return 1;
		return 0;
	}
	public List<Documents> queryDoc(int uId,String title,String note) {
		List<Documents> documents=docuImpl.findByCondition(uId,title, note);
		for(Documents d:documents)
		{
			UserInfo userInfo=userImpl.findById(uId);
		    d.setUserInfo(userInfo);
		}
		return documents;
	}

}
