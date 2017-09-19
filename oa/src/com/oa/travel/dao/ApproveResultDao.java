package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.ApproveResult;

public interface ApproveResultDao {
   public int insert(ApproveResult ar);
   public List<ApproveResult> findByFormNo(String formNo);
   public ApproveResult finByWsId(int wsId);

}
