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
	 * (��ȥ)�޸Ŀ��(��Ʒ)
	 */

	public int reduceStore(int InventId) {
		int ret = inventoryDaoImpl.reduceStore(InventId);
		return ret;
	}

	/**
	 * (��ȥ)�޸Ŀ��(��Ʒ)
	 */
	public int reducePStore(int number,int InventId ) {
		int ret = inventoryDaoImpl.reducePStore(number,InventId );
		return ret;
	}
	
	/**
	 * ͨ�����ƣ����� ��ѯ
	 */
	public Inventory searchByNameAndType(String inventoryName, String type) {
	Inventory	inventory=inventoryDaoImpl.findByNameAndType(inventoryName, type);
		return inventory;
	}
	
	/**
	    * (���)�޸Ŀ��(��Ʒ)
	    */

	
	public int addPStore(int number, int InventId) {
		return inventoryDaoImpl.addPStore(number, InventId);
	}

	/**
	 * ͨ�����id��ѯ
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
