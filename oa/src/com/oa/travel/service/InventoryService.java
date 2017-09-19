package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Inventory;

public interface InventoryService {
	/**
	 * 添加库存表
	 */
	int add(Inventory inventory);
	 /**
		    * (减去)修改库存(物品)
		    */
		public int reduceStore(int InventId);
		   /**
		    * (减去)修改库存(礼品)
		    */

		public int reducePStore(int InventId,int number);
		
		/**
		 * 通过名称，类型 查询
		 */
		public Inventory searchByNameAndType(String inventoryName, String type);

		/**
		    * (添加)修改库存(礼品)
		    */

		public int addPStore(int number, int InventId);
		/**
		 * 通过id查询
		 * @param id
		 * @return
		 */
		 public Inventory searchById(int id);
			/*
			 * 根据库存类型寻找库存信息，拉出所有的物品和礼品列表信息 (non-Javadoc)
			 * 
			 * @see com.oa.travel.dao.InventoryDao#findByTypes(java.lang.String)
			 */
			public List<Inventory> searchByTypes(String types);

}
