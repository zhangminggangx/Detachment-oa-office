package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.Result;

public interface ResultDao {
   public List<Result> findAll();
   public Result findById(int id);
   public int insert(Result r);
   public int delete(int rId);
}
