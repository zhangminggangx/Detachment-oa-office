package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.Inventory;

public interface InventoryDao {
   public List<Inventory> findAll();
   public List<Inventory> findAll(int pageSize,int pageNo);
   public int computePageCount(int pageSize);
   public List<Inventory> findByTypes(String types);
   public Inventory findById(int id);
   public int delete(int id);
   public int insert(Inventory i);
   /**
    * 通过库存物品名和类型查找物品
    */
   public Inventory findByNameAndType(String inventoryName,String type);
   /**
    * 修改库存（添加）
    */
   int updateStore(int InventId);
   /**
    * (减去)修改库存(物品)
    */
   int reduceStore(int InventId);
   /**
    * (减去)修改库存(礼品)
    */

   public int reducePStore(int InventId,int number);
   
   /**
    * (添加)修改库存(礼品)
    */

   public int addPStore(int number,int InventId);

}
