package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Inventory;

public interface InventoryService {
	/**
	 * ��ӿ���
	 */
	int add(Inventory inventory);
	 /**
		    * (��ȥ)�޸Ŀ��(��Ʒ)
		    */
		public int reduceStore(int InventId);
		   /**
		    * (��ȥ)�޸Ŀ��(��Ʒ)
		    */

		public int reducePStore(int InventId,int number);
		
		/**
		 * ͨ�����ƣ����� ��ѯ
		 */
		public Inventory searchByNameAndType(String inventoryName, String type);

		/**
		    * (���)�޸Ŀ��(��Ʒ)
		    */

		public int addPStore(int number, int InventId);
		/**
		 * ͨ��id��ѯ
		 * @param id
		 * @return
		 */
		 public Inventory searchById(int id);
			/*
			 * ���ݿ������Ѱ�ҿ����Ϣ���������е���Ʒ����Ʒ�б���Ϣ (non-Javadoc)
			 * 
			 * @see com.oa.travel.dao.InventoryDao#findByTypes(java.lang.String)
			 */
			public List<Inventory> searchByTypes(String types);

}
