package com.oa.deskTop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.oa.deskTop.entity.CommTypes;
import com.oa.deskTop.entity.Communication;
import com.oa.deskTop.entity.SinComm;
import com.oa.deskTop.service.CommTypesService;
import com.oa.deskTop.service.CommunicationService;
import com.oa.deskTop.service.SinCommService;
import com.oa.deskTop.serviceImpl.CommTypesServiceImpl;
import com.oa.deskTop.serviceImpl.CommunicationServiceImpl;
import com.oa.deskTop.serviceImpl.SinCommServiceImpl;
import com.oa.personnel.entity.Department;
import com.oa.personnel.entity.UserInfo;
import com.oa.personnel.service.DepartmentService;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;

public class SearchAllCommunicationServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchAllCommunicationServlet() {
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
	private CommunicationService commService = new CommunicationServiceImpl();
	private DepartmentService deptService = new DepartmentServiceImpl();
	private SinCommService sinService = new SinCommServiceImpl();
	private CommTypesService commTypesService = new CommTypesServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
		String pageNoStr=request.getParameter("pageNo");
		int pageNo =1;
		if(pageNoStr!=null){
			pageNo=Integer.parseInt(pageNoStr);
		}
		List<CommTypes> typeList = commTypesService.searchAll();
		
		List<Communication> commList=null;
		
		
		commList=(List<Communication> )request.getAttribute("commList");
		if(commList!=null){
			int pageCount = commService.computPageCount(10);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNo", pageNo);
		}else{
			commList= commService.serachAll(pageNo, 10);
		}
		List<Department> deptList =deptService.searchAll();
		request.setAttribute("commList", commList);
		request.setAttribute("deptList", deptList);
		//全部通讯录
		
		
		
		//个人通讯录
		int uId= userInfo.getUid();
		String pageNoStrSin=request.getParameter("pageNoSin");
		int pageNoSin =1;
		if(pageNoStr!=null){
			pageNoSin=Integer.parseInt(pageNoStrSin);
		}
		List<SinComm> sinList = sinService.searchAllSinComm(pageNoSin, 10, uId);
		request.setAttribute("pageNoSin", pageNoSin);
		request.setAttribute("sinList", sinList);
		
		
		request.setAttribute("typeList", typeList);
		
		request.getRequestDispatcher("/html/tongxunlu/tongxunlu.jsp").forward(request, response);

		
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
