package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.Goods;

public interface GoodsDao {
	public List<Goods> findAll();

	public List<Goods> findAll(int pageSize, int pageNo);

	public int insert(Goods g);

	public int delete(int id);

	public int computePageCount(int pageSize);
	/**
	 * 修改操作时撤销修改物品返回操作
	 */
	int updateReturnFalse(int inventId, int goodsId);

	/**
	 *物品返回（改为true已返回)
	 * @param inventId
	 * @param goodsId
	 * @return
	 */
	public int updateHasReturn(int inventId, int goodsId);

	/**
	 * 通过库存id和关联的出差申请查询唯一的物品信息
	 */
	Goods findByInvIdAndAppId(int invId, int appId);

	/**
	 * 通过出差申请的id查询
	 * 
	 */
	List<Goods> findByAppId(int AppId);

	/**
	 * 通过出差申请的id查询---视图关联查询---库存表物品名和物品
	 */
	List<Goods> findViewGoodsInvName(int AppId);

	/**
	 * 通过出差申请单id删除
	 * 
	 * @param appId
	 * @return
	 */
	public int deleteByAppId(int appId);
	
	public int insert2(Goods g);
	/**
	 * 查询出差申请未归还的物品
	 */
	List<Goods> findUnReturnByAppId(int AppId);

}
