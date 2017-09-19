package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.Present;

public interface PresentDao {
	  public List<Present> findAll();
	  public List<Present> findAll(int pageSize,int pageNo);
	  public int insert(Present p);
	  public int delete(int inventId,int appId);
	  public int computePageCount(int pageSize);
	  /**
	     * 通过出差申请的id查询
	     * 
	     */
	    List<Present> findByAppId(int AppId);
	    /**
	     * 通过出差申请的id查询---视图关联查询---库存表物品名和礼品
	     */
	    List<Present> findViewPresentInvName(int AppId);
	    
	    /*很据物品Id和申请单Id查找这个物品的出库数量*/
	    int findCountByInventIdAndAppId(int inventId,int appId);

}
