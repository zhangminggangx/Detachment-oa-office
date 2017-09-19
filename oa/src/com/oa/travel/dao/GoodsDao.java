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
	 * �޸Ĳ���ʱ�����޸���Ʒ���ز���
	 */
	int updateReturnFalse(int inventId, int goodsId);

	/**
	 *��Ʒ���أ���Ϊtrue�ѷ���)
	 * @param inventId
	 * @param goodsId
	 * @return
	 */
	public int updateHasReturn(int inventId, int goodsId);

	/**
	 * ͨ�����id�͹����ĳ��������ѯΨһ����Ʒ��Ϣ
	 */
	Goods findByInvIdAndAppId(int invId, int appId);

	/**
	 * ͨ�����������id��ѯ
	 * 
	 */
	List<Goods> findByAppId(int AppId);

	/**
	 * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ������Ʒ
	 */
	List<Goods> findViewGoodsInvName(int AppId);

	/**
	 * ͨ���������뵥idɾ��
	 * 
	 * @param appId
	 * @return
	 */
	public int deleteByAppId(int appId);
	
	public int insert2(Goods g);
	/**
	 * ��ѯ��������δ�黹����Ʒ
	 */
	List<Goods> findUnReturnByAppId(int AppId);

}
