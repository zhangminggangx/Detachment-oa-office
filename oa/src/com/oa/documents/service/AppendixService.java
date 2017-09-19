package com.oa.documents.service;

import java.util.List;

import com.oa.documents.entity.Appendix;

public interface AppendixService {
  public int add(Appendix appendix);
  public List<Appendix> searchByDocId(int docId);
  public Appendix searchById(int appendId);
}
