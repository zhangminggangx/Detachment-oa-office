package com.oa.dispatch.service;

import java.util.List;

import com.oa.dispatch.entity.DisDetail;

public interface DisDetailService {
   public List<DisDetail> searchByDisId(int disId);
}
