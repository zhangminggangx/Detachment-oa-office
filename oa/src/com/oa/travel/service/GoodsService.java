package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Goods;

public interface GoodsService {
	/**
	 * 添加物品表
	 */
	int add(Goods goods);
	/**
	 * 返还物品，更新物品表
	 */
	int returnGoods(String[] goodsName,int appId );
	/**
	 * 通过出差申请的id查询
	 */
	List<Goods> searchByAppId(int appId);
	/**
	   * 通过出差申请的id查询---视图关联查询---库存表物品名和物品
	   */
	public List<Goods> SearchViewGoodsInvName(int AppId) ;
	
	/**
	 * 更新前删除（根据出差申请id）
	 */
	int deleteByAppId(int appId);
	
	/**
	 * 修改操作时撤销修改物品返回操作
	 */
	int updateReturnFalse(List<Goods> goodsList,int appId );
	
	public int add2(Goods g);
	
	/**
	 * 查询出差申请未归还的物品
	 */
	public List<Goods> searchUnReturnByAppId(int AppId);
	
}
