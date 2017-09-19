package com.oa.travel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.oa.travel.entity.Goods;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.serviceImpl.GoodsServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;

public class GetReportAppGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetReportAppGoodsServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	TravelAppServiceImpl travelAppServiceImpl=new TravelAppServiceImpl();
	GoodsServiceImpl goodsServiceImpl=new GoodsServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String appformNo=request.getParameter("appformNo");
		TravelApp travelApp=travelAppServiceImpl.searchByFormNo(appformNo);
		List<Goods> unGoodsList=goodsServiceImpl.searchUnReturnByAppId(travelApp.getAppId());
		JSONArray jsonArray=JSONArray.fromObject(unGoodsList);
		response.getWriter().print(jsonArray);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
