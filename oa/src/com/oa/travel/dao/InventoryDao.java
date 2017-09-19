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
    * ͨ�������Ʒ�������Ͳ�����Ʒ
    */
   public Inventory findByNameAndType(String inventoryName,String type);
   /**
    * �޸Ŀ�棨��ӣ�
    */
   int updateStore(int InventId);
   /**
    * (��ȥ)�޸Ŀ��(��Ʒ)
    */
   int reduceStore(int InventId);
   /**
    * (��ȥ)�޸Ŀ��(��Ʒ)
    */

   public int reducePStore(int InventId,int number);
   
   /**
    * (���)�޸Ŀ��(��Ʒ)
    */

   public int addPStore(int number,int InventId);

}
