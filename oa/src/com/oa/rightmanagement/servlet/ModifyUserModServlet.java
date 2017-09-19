package com.oa.rightmanagement.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oa.rightmanagement.entity.ModuleAcl;
import com.oa.rightmanagement.serviceImpl.FunACLServiceImpl;
import com.oa.rightmanagement.serviceImpl.ModuleAclServiceImpl;

public class ModifyUserModServlet extends HttpServlet {
	private ModuleAclServiceImpl aclServiceImpl=new ModuleAclServiceImpl();

	/**
	 * Constructor of the object.
	 */
	public ModifyUserModServlet() {
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
private FunACLServiceImpl funACLServiceImpl=new FunACLServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String roleIdStr=request.getParameter("roleId");
		int roleId=Integer.parseInt(roleIdStr);
		String modIdStr=request.getParameter("modIdStr");
		String[] modIdArr=modIdStr.split(";");
		List<ModuleAcl> moduleAcls=new ArrayList<ModuleAcl>();
		
		for(int i=0;i<modIdArr.length;i++)
		{
			if(modIdArr[i].equals("fcode04002")){
				funACLServiceImpl.add(roleId, 24);
				
			}else{
			int modId=Integer.parseInt(modIdArr[i]);
			ModuleAcl ma=new ModuleAcl();
			ma.setRoleId(roleId);
			ma.setModId(modId);
			moduleAcls.add(ma);
			}
		}
		int add=aclServiceImpl.add(moduleAcls);
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
