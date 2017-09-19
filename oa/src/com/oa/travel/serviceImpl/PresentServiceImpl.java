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
		
	}/*根据申请表id查找*/
	public List<Present> searchByAppId(int appId) {
		List<Present> prelist= presentDaoImpl.findByAppId(appId);
		return prelist;
	}
	/**
	   * 通过出差申请的id查询---视图关联查询---库存表物品名礼品
	   */
	public List<Present> SearchViewPresentInvName(int AppId) {
		List<Present> presentList=presentDaoImpl.findViewPresentInvName(AppId);
		return presentList;
	}
	
	 /*很据物品Id和申请单Id查找这个物品的出库数量*/
	public int searchCountByInventIdAndAppId(int inventId, int appId) {
		int ret= presentDaoImpl.findCountByInventIdAndAppId(inventId, appId);
		return ret;
	}
	
	/*根据库存id和申请表id删除*/
	public int delete(int inventId,int appId) {
		
		return presentDaoImpl.delete( inventId, appId) ;
	}


}
