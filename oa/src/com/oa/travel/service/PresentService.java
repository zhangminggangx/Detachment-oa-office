package com.oa.travel.service;

import java.util.List;

import com.oa.travel.entity.Present;

public interface PresentService {
	
	/**
	 * �����Ʒ��
	 */
	int add(Present present);
	/**
	 * ͨ�����������id��ѯ
	 */
	List<Present> searchByAppId(int appId);
	/**
	   * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ����Ʒ
	   */
	public List<Present> SearchViewPresentInvName(int AppId) ;
	
	/*�ܾ���ƷId�����뵥Id���������Ʒ�ĳ�������*/
	public int searchCountByInventIdAndAppId(int inventId, int appId);

	/*���ݿ��id�������idɾ��*/
	public int delete(int inventId,int appId);
	
	

}
