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
	 * 当员工要出差时需要向goods表中插入数据 (non-Javadoc)
	 * 
	 * @see com.oa.travel.daoImpl.GoodsDao#insert(com.oa.travel.entity.Goods)
	 */
	public int add(Goods goods) {
		int ret = goodsDaoImpl.insert(goods);
		return ret;
	}

	/**
	 * 物品返还
	 */
	public int returnGoods(String[] goodsNames, int appId) {
		int goodsRet = 0;
	//	int invRet = 0;
		System.out.println(goodsNames.length);
		for (int i = 0; i < goodsNames.length; i++) {
			if ((!goodsNames[i].equals(null)) && goodsNames[i] != "") {
				Inventory inventory = inventoryDaoImpl.findByNameAndType(
						goodsNames[i], "物品");
				Goods goods = goodsDaoImpl.findByInvIdAndAppId(inventory
						.getInventId(), appId);
				// 修改物品表,同时修改库存
				goodsRet = goodsDaoImpl.updateHasReturn(
						inventory.getInventId(), goods.getGoodsId());
				// 修改库存
			//	invRet = inventoryDaoImpl.updateStore(inventory.getInventId());
			}
		}
	//	return goodsRet + invRet;
		return goodsRet ;
	}

	/**
	 * 通过出差申请id查询
	 */
	public List<Goods> searchByAppId(int appId) {
		List<Goods> goodList = goodsDaoImpl.findByAppId(appId);
		return goodList;
	}

	/**
	 * 通过出差申请的id查询---视图关联查询---库存表物品名和物品
	 */
	public List<Goods> SearchViewGoodsInvName(int AppId) {
		List<Goods> goodsList = goodsDaoImpl.findViewGoodsInvName(AppId);
		return goodsList;
	}

	/**
	 * 更新前撤销之前的修改操作（根据出差申请id）
	 */
	public int deleteByAppId(int appId) {
		int invRet = 0;
		// 删除物品表信息
	
		List<Goods> goodsList = goodsDaoImpl.findViewGoodsInvName(appId);
		for (int i = 0; i < goodsList.size(); i++) {
			Inventory inventory = inventoryDaoImpl.findByNameAndType(goodsList
					.get(i).getGoodsName(), "物品");
			// 修改库存(将库存减回最初状态)
			invRet = inventoryDaoImpl.updateStore(inventory.getInventId());
		}
		int delRet = goodsDaoImpl.deleteByAppId(appId);
		return invRet + delRet;
	}

	/**
	 * 修改操作时撤销修改物品返回操作
	 */

	public int updateReturnFalse(List<Goods> goodsList,int appId ) {
		//同时修改了库存和物品表
		int goodsRet = 0;
			for (int i = 0; i < goodsList.size(); i++) {
				if ((!goodsList.get(i).getGoodsName().equals(null)) &&( goodsList.get(i).getGoodsName() != "")) {
					Inventory inventory = inventoryDaoImpl.findByNameAndType(
							goodsList.get(i).getGoodsName(), "物品");
					Goods goods = goodsDaoImpl.findByInvIdAndAppId(inventory
							.getInventId(), appId);
					// 修改物品表,同时修改库存
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
	 * 查询出差申请未归还的物品
	 */
	public List<Goods> searchUnReturnByAppId(int AppId) {
		List<Goods> goodList = goodsDaoImpl.findUnReturnByAppId(AppId);
		return goodList;
	}


}
