package com.oa.travel.serviceImpl;

import java.util.List;

import com.oa.travel.daoImpl.PresentDaoImpl;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Present;
import com.oa.travel.service.PresentService;

public class PresentServiceImpl implements PresentService {
private PresentDaoImpl presentDaoImpl =new PresentDaoImpl();
	public int add(Present present) {
		int ret=presentDaoImpl.insert(present);
		return ret;
		
	}/*���������id����*/
	public List<Present> searchByAppId(int appId) {
		List<Present> prelist= presentDaoImpl.findByAppId(appId);
		return prelist;
	}
	/**
	   * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ����Ʒ
	   */
	public List<Present> SearchViewPresentInvName(int AppId) {
		List<Present> presentList=presentDaoImpl.findViewPresentInvName(AppId);
		return presentList;
	}
	
	 /*�ܾ���ƷId�����뵥Id���������Ʒ�ĳ�������*/
	public int searchCountByInventIdAndAppId(int inventId, int appId) {
		int ret= presentDaoImpl.findCountByInventIdAndAppId(inventId, appId);
		return ret;
	}
	
	/*���ݿ��id�������idɾ��*/
	public int delete(int inventId,int appId) {
		
		return presentDaoImpl.delete( inventId, appId) ;
	}


}
