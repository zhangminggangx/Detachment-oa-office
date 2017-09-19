package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Goods;

public interface GoodsService {
	/**
	 * �����Ʒ��
	 */
	int add(Goods goods);
	/**
	 * ������Ʒ��������Ʒ��
	 */
	int returnGoods(String[] goodsName,int appId );
	/**
	 * ͨ�����������id��ѯ
	 */
	List<Goods> searchByAppId(int appId);
	/**
	   * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ������Ʒ
	   */
	public List<Goods> SearchViewGoodsInvName(int AppId) ;
	
	/**
	 * ����ǰɾ�������ݳ�������id��
	 */
	int deleteByAppId(int appId);
	
	/**
	 * �޸Ĳ���ʱ�����޸���Ʒ���ز���
	 */
	int updateReturnFalse(List<Goods> goodsList,int appId );
	
	public int add2(Goods g);
	
	/**
	 * ��ѯ��������δ�黹����Ʒ
	 */
	public List<Goods> searchUnReturnByAppId(int AppId);
	
}
