package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Result;

public interface ResultService {
  public List<Result> queryAll();
  public Result findById(int rsId);
}
