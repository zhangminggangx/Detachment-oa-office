package com.oa.travel.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.personnel.entity.Employee;
import com.oa.personnel.serviceImpl.DepartmentServiceImpl;
import com.oa.personnel.serviceImpl.EmployeeServiceImpl;
import com.oa.travel.entity.ApproveResult;
import com.oa.travel.entity.Goods;
import com.oa.travel.entity.Inventory;
import com.oa.travel.entity.Present;
import com.oa.travel.entity.Result;
import com.oa.travel.entity.TravelApp;
import com.oa.travel.entity.WorkStream;
import com.oa.travel.serviceImpl.ApprovedResultServiceImpl;
import com.oa.travel.serviceImpl.GoodsServiceImpl;
import com.oa.travel.serviceImpl.InventoryServiceImp;
import com.oa.travel.serviceImpl.PresentServiceImpl;
import com.oa.travel.serviceImpl.ResultServiceImpl;
import com.oa.travel.serviceImpl.TravelAppServiceImpl;
import com.oa.travel.serviceImpl.WorkStreamServiceImpl;

public class TravelAppDetailedServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TravelAppDetailedServlet() {
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
	
	
private ResultServiceImpl resultServiceImpl=new ResultServiceImpl();
	
	private WorkStreamServiceImpl workStreamServiceImpl=new WorkStreamServiceImpl();
	private DepartmentServiceImpl departmentServiceImpl=new DepartmentServiceImpl();
	EmployeeServiceImpl employeeServiceImpl = new EmployeeServiceImpl();
	
	private ApprovedResultServiceImpl approvedResultServiceImpl = new ApprovedResultServiceImpl();
	private TravelAppServiceImpl travelAppServiceImpl = new TravelAppServiceImpl();
	private GoodsServiceImpl goodsServiceImpl = new GoodsServiceImpl();
	private PresentServiceImpl presentServiceImpl =new PresentServiceImpl();
	private InventoryServiceImp inventoryServiceImp=new InventoryServiceImp();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         String formNo=(String) request.getParameter("formNo");
         TravelApp travelApp = new TravelApp();
         travelApp=travelAppServiceImpl.searchByFormNo(formNo);
         int appId= travelApp.getAppId();
         List<Goods> goodslist=goodsServiceImpl.SearchViewGoodsInvName(appId);
       
         List<Inventory> inventories=inventoryServiceImp.searchByTypes("物品");
         List<Integer> a = new ArrayList<Integer> ();
         
        for (Inventory inventory : inventories) {
        	boolean flag=false;//默认goodslist中没有与inventory相同的inventid
        	  for (Goods goods : goodslist) {
        		  
        		  if(inventory.getInventId()==goods.getInventId())
        		  {
        			  flag=true;
        			  
        		  }
      			
      		}
        	  if(flag==false)
        	  {
        		a.add(inventory.getInventId());
        	  }
			
		}
        
       
        List<Inventory> inventories2=new ArrayList<Inventory>();
        
        for( int i=0;i<a.size();i++){
        int b=a.get(i);
        Inventory inventory = inventoryServiceImp.searchById(b);
        inventories2.add(inventory);
        }
         List<Present> prelist = presentServiceImpl.SearchViewPresentInvName(appId);
         
         
       //查询审核结果
	      List<ApproveResult> approvedResults=approvedResultServiceImpl.findByFormNo(formNo);
	        for (ApproveResult approveResult1 : approvedResults) {
				Result rs=resultServiceImpl.findById(approveResult1.getResultId());
				WorkStream ws=workStreamServiceImpl.findById(approveResult1.getWsId());
				int bossId=ws.getToId();
				Employee bossEmp=null;
				if(bossId==0)
				{
					int deptId=departmentServiceImpl.searchDeptId("董事会");
					int dsId=employeeServiceImpl.searchByDeptId(deptId, "总经理").getEmpId();
					bossEmp=employeeServiceImpl.SearchById(dsId);
				}
				else{
				 bossEmp=employeeServiceImpl.SearchById(bossId);
				}
				approveResult1.setEmployee(bossEmp);
				approveResult1.setResult(rs);
			}	

	
		
		
		
	    request.setAttribute("approvedResults", approvedResults);
         
         
         
         request.setAttribute("travelApp", travelApp);
         request.setAttribute("goodslist", goodslist);
      
         request.setAttribute("inventories2", inventories2);
         request.setAttribute("prelist", prelist);
         request.getRequestDispatcher("/html/worktime/moreleavelist_2.jsp").forward(request, response);
         
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
