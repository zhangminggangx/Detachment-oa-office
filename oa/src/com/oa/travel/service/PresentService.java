package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Present;

public interface PresentService {
	
	/**
	 * 添加礼品表
	 */
	int add(Present present);
	/**
	 * 通过出差申请的id查询
	 */
	List<Present> searchByAppId(int appId);
	/**
	   * 通过出差申请的id查询---视图关联查询---库存表物品名礼品
	   */
	public List<Present> SearchViewPresentInvName(int AppId) ;
	
	/*很据物品Id和申请单Id查找这个物品的出库数量*/
	public int searchCountByInventIdAndAppId(int inventId, int appId);

	/*根据库存id和申请表id删除*/
	public int delete(int inventId,int appId);
	
	

}
