package com.oa.travel.serviceImpl;

import java.util.List;

import com.oa.travel.daoImpl.InventoryDaoImpl;
import com.oa.travel.entity.Inventory;
import com.oa.travel.service.InventoryService;

public class InventoryServiceImp implements InventoryService {

	private InventoryDaoImpl inventoryDaoImpl = new InventoryDaoImpl();

	public int add(Inventory inventory) {
		int ret = inventoryDaoImpl.insert(inventory);
		return ret;
	}

	/**
	 * (减去)修改库存(物品)
	 */

	public int reduceStore(int InventId) {
		int ret = inventoryDaoImpl.reduceStore(InventId);
		return ret;
	}

	/**
	 * (减去)修改库存(礼品)
	 */
	public int reducePStore(int number,int InventId ) {
		int ret = inventoryDaoImpl.reducePStore(number,InventId );
		return ret;
	}
	
	/**
	 * 通过名称，类型 查询
	 */
	public Inventory searchByNameAndType(String inventoryName, String type) {
	Inventory	inventory=inventoryDaoImpl.findByNameAndType(inventoryName, type);
		return inventory;
	}
	
	/**
	    * (添加)修改库存(礼品)
	    */

	
	public int addPStore(int number, int InventId) {
		return inventoryDaoImpl.addPStore(number, InventId);
	}

	/**
	 * 通过库存id查询
	 * @param id
	 * @return
	 */
	public Inventory searchById(int id) {
		Inventory inventory=inventoryDaoImpl.findById(id);
		return inventory;
	}

	public List<Inventory> searchByTypes(String types) {
		return inventoryDaoImpl.findByTypes(types);	}

	

}
