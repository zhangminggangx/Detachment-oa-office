package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.WorkStream;

public interface WorkStreamDao {
  public int insert(WorkStream ws);
  public List<WorkStream> findByBossId(int id,int pageSize,int pageNo);
  public WorkStream findById(int wsId);
  public WorkStream findByFormNo(String formNo);
  public int updateHasApproved(int wsId);
  public List<WorkStream> findApprovedDis(int empId,int pageSize,int pageNo);
  public int computePageCount(int id, int pageSize,boolean hasApproved);
  public int computePageCount(int id, int pageSize,boolean hasApproved,String likeFormNo);
}
