package com.oa.travel.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.oa.travel.daoImpl.TravelAppDaoImpl;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Inventory;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.service.TravelAppService;

public class TravelAppServiceImpl implements TravelAppService {
	private TravelAppDaoImpl travelAppDaoImpl = new TravelAppDaoImpl();
	private GoodsServiceImpl goodsServiceImpl = new GoodsServiceImpl();
	private InventoryServiceImp inventoryServiceImp = new InventoryServiceImp();

	public int add(TravelApp travelApp) {
		int ret = travelAppDaoImpl.insert(travelApp);
		return ret;
	}

	public int modify(int appId) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * �����û���״̬��������
	 */
	public List<TravelApp> searchByEmpIdAndState(int empId, int state) {
		List<TravelApp> travelApps = travelAppDaoImpl.findByEmpIdAndState(
				empId, state);
		// ������Ʒ��Ϣ(δ�黹)
		for (TravelApp travelApp : travelApps) {
			List<Goods> goodsList = goodsServiceImpl.searchUnReturnByAppId(travelApp
					.getAppId());
			//�������õ���Ʒ��
			for (Goods goods : goodsList) {
				Inventory inventory = inventoryServiceImp.searchById(goods
						.getInventId());
				goods.setGoodsName(inventory.getGoodsName());
			}
			travelApp.setGoodsList(goodsList);
		
		}
		return travelApps;
	}

	public TravelApp searchByFormNo(String formNo) {
		TravelApp travelApp = travelAppDaoImpl.findByFormNo(formNo);
		return travelApp;
	}

	/**
	 * ͨ��id��ѯ
	 */
	public TravelApp searchById(int appId) {
		TravelApp travelApp = travelAppDaoImpl.findById(appId);
		return travelApp;
	}

	/*
	 * ��ҳ��ѯ���еĵ�����Ϣ (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */
	public List<TravelApp> searchAll(int pageSize, int pageNo) {
		List<TravelApp> l = travelAppDaoImpl.findAll(pageSize, pageNo);
		return l;
	}

	/*
	 * ����ҳ�� (non-Javadoc)
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */

	public int computePageCount(int pageSize) {
		int page = travelAppDaoImpl.computePageCount(pageSize);
		return page;
	}

	/*
	 * Ա���޸�
	 */
	public int appupdate(int appId, String travelReason, String travelPlace,
			int planTime, Date leaveTime,int state) {
		int ret = travelAppDaoImpl.appupdate(appId, travelReason, travelPlace,
				planTime, leaveTime,state);
		return ret;
	}
	/**
	 * ��ѯ����˵ĳ������뵥
	 */
	public List<TravelApp> searchApproveApp(List<WorkStream> workStreamsList) {
		List<TravelApp> travelReportsList = new ArrayList<TravelApp>();
		List<TravelApp> sqTApp = new ArrayList<TravelApp>();
		for (int i = 0; i < workStreamsList.size(); i++) {
			if (workStreamsList.get(i).getFormNo().substring(0, 2).equals("SQ")) {
				TravelApp travelApp = new TravelApp();
				String bgFormNo = workStreamsList.get(i).getFormNo();
				travelApp = travelAppDaoImpl.findByFormNo(bgFormNo);
				travelApp.setWsId(workStreamsList.get(i).getWsId());
				sqTApp.add(travelApp);

			}
		}
		return sqTApp;
	}
	
	/*
	 * ��ҳ��ѯ���еĵ�����Ϣ (non-Javadoc)����empId��state
	 * 
	 * @see com.oa.travel.dao.TravelAppDao#findAll(int, int)
	 */

	public List<TravelApp> searchAllByEmpIdAndState(int pageSize, int pageNo,
			int empId, int state){
		return travelAppDaoImpl.findAllByEmpIdAndState(pageSize, pageNo, empId, state);
		
	}
	
	/*
	 * ����ҳ��(��ĳ��״̬��)
	 * (non-Javadoc)
	 * @see com.oa.travel.dao.TravelAppDao#computePageCount(int)
	 */
	public int computePageCountByState(int pageSize, int state) {
		return travelAppDaoImpl.computePageCountByState(pageSize, state);
	}
	/**
	 * �޸����뵥״̬
	 */

	public int updateAppState(int appId, int newState) {
		int ret = travelAppDaoImpl.updateAppState(appId, newState);
		return ret;
	}

	/*
	 * �����޸�
	 */

	public int adupdate(int appId, String trafficTools, double trafficFee,
			Date orderTime, String hotelName, double roomFee, String leavePlan,
			String backPlan) {
		return travelAppDaoImpl.adupdate(appId, trafficTools,
				trafficFee, orderTime, hotelName, roomFee, leavePlan, backPlan);
	}

	/**
	 * ɾ��
	 */
	public int delete(int appId) {
int ret=		travelAppDaoImpl.delete(appId);
		return ret;
	}



}
