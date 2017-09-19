package com.oa.documents.service;

import java.util.List;

import com.oa.documents.entity.Documents;

public interface DocumentsService {
  public int add(Documents documents);
  public int findMaxId();
  public List<Documents> searchAll(int uId);
  public int delete(int docId);
  public List<Documents> queryDoc(int uId,String title,String note);
}
