package com.oa.travel.dao;

import java.util.List;

import com.oa.travel.entity.Present;

public interface PresentDao {
	  public List<Present> findAll();
	  public List<Present> findAll(int pageSize,int pageNo);
	  public int insert(Present p);
	  public int delete(int inventId,int appId);
	  public int computePageCount(int pageSize);
	  /**
	     * ͨ�����������id��ѯ
	     * 
	     */
	    List<Present> findByAppId(int AppId);
	    /**
	     * ͨ�����������id��ѯ---��ͼ������ѯ---������Ʒ������Ʒ
	     */
	    List<Present> findViewPresentInvName(int AppId);
	    
	    /*�ܾ���ƷId�����뵥Id���������Ʒ�ĳ�������*/
	    int findCountByInventIdAndAppId(int inventId,int appId);

}
