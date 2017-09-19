package com.oa.travel.serviceImpl;

import java.util.List;

import com.oa.travel.daoImpl.GoodsDaoImpl;
import com.oa.travel.daoImpl.InventoryDaoImpl;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Inventory;
import com.oa.travel.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {

	private GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
	private InventoryDaoImpl inventoryDaoImpl = new InventoryDaoImpl();

	/*
	 * ��Ա��Ҫ����ʱ��Ҫ��goods���в������� (non-Javadoc)
	 * 
	 * @see com.oa.travel.daoImpl.GoodsDao#insert(com.oa.travel.entity.Goods)
	 */
	public int add(Goods goods) {
		int ret = goodsDaoImpl.insert(goods);
		return ret;
	}

	/**
	 * ��Ʒ����
	 */
	public int returnGoods(String[] goodsNames, int appId) {
		int goodsRet = 0;
	//	int invRet = 0;
		System.out.println(goodsNames.length);
		for (int i = 0; i < goodsNames.length; i++) {
			if ((!goodsNames[i].equals(null)) && goodsNames[i] != "") {
				Inventory inventory = inventoryDaoImpl.findByNameAndType(
						goodsNames[i], "��Ʒ");
				Goods goods = goodsDaoImpl.findByInvIdAndAppId(inventory
						.getInventId(), appId);
				// �޸���Ʒ��,ͬʱ�޸Ŀ��
				goodsRet = goodsDaoImpl.updateHasReturn(
						inventory.getInventId(), goods.getGoodsId());
				// �޸Ŀ��
			//	invRet = inventoryDaoImpl.updateStore(inventory.getInventId());
			}
		}
	//	return goodsRet + invRet;
		return goodsRet ;
	}

	/**
	 * ͨ����������id��ѯ
	 */
	public List<Goods> searchByAppId(int appId) {
		List<Goods> goodList = goodsDaoImpl.findByAppId(appId);
		return goodList;
	}

	/**
	 * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ������Ʒ
	 */
	public List<Goods> SearchViewGoodsInvName(int AppId) {
		List<Goods> goodsList = goodsDaoImpl.findViewGoodsInvName(AppId);
		return goodsList;
	}

	/**
	 * ����ǰ����֮ǰ���޸Ĳ��������ݳ�������id��
	 */
	public int deleteByAppId(int appId) {
		int invRet = 0;
		// ɾ����Ʒ����Ϣ
	
		List<Goods> goodsList = goodsDaoImpl.findViewGoodsInvName(appId);
		for (int i = 0; i < goodsList.size(); i++) {
			Inventory inventory = inventoryDaoImpl.findByNameAndType(goodsList
					.get(i).getGoodsName(), "��Ʒ");
			// �޸Ŀ��(�����������״̬)
			invRet = inventoryDaoImpl.updateStore(inventory.getInventId());
		}
		int delRet = goodsDaoImpl.deleteByAppId(appId);
		return invRet + delRet;
	}

	/**
	 * �޸Ĳ���ʱ�����޸���Ʒ���ز���
	 */

	public int updateReturnFalse(List<Goods> goodsList,int appId ) {
		//ͬʱ�޸��˿�����Ʒ��
		int goodsRet = 0;
			for (int i = 0; i < goodsList.size(); i++) {
				if ((!goodsList.get(i).getGoodsName().equals(null)) &&( goodsList.get(i).getGoodsName() != "")) {
					Inventory inventory = inventoryDaoImpl.findByNameAndType(
							goodsList.get(i).getGoodsName(), "��Ʒ");
					Goods goods = goodsDaoImpl.findByInvIdAndAppId(inventory
							.getInventId(), appId);
					// �޸���Ʒ��,ͬʱ�޸Ŀ��
					goodsRet = goodsDaoImpl.updateReturnFalse(
							inventory.getInventId(), goods.getGoodsId());
					
				}
			}
		
			return goodsRet ;
	}
	
	public int add2(Goods g) {
		int ret = goodsDaoImpl.insert2(g);
		return ret;
	}
	/**
	 * ��ѯ��������δ�黹����Ʒ
	 */
	public List<Goods> searchUnReturnByAppId(int AppId) {
		List<Goods> goodList = goodsDaoImpl.findUnReturnByAppId(AppId);
		return goodList;
	}


}
