package com.oa.rightmanagement.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oa.rightmanagement.entity.FunACL;
import com.oa.rightmanagement.entity.Module;
import com.oa.rightmanagement.entity.ModuleAcl;
import com.oa.rightmanagement.entity.ModuleFun;
import com.oa.rightmanagement.entity.Role;
import com.oa.rightmanagement.serviceImpl.FunACLServiceImpl;
import com.oa.rightmanagement.serviceImpl.ModuleAclServiceImpl;
import com.oa.rightmanagement.serviceImpl.ModuleFunServiceImpl;
import com.oa.rightmanagement.serviceImpl.ModuleServiceImpl;
import com.oa.rightmanagement.serviceImpl.RoleServiceImpl;

public class ViewRoleDetailServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ViewRoleDetailServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */

	ModuleAclServiceImpl moduleAclServiceImpl = new ModuleAclServiceImpl();
	FunACLServiceImpl funACLServiceImpl = new FunACLServiceImpl();
    
	ModuleFunServiceImpl moduleFunServiceImpl = new ModuleFunServiceImpl();
	ModuleServiceImpl moduleServiceImpl = new ModuleServiceImpl();
	RoleServiceImpl roleServiceImpl=new RoleServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String roleIdStr = request.getParameter("roleId");
		int roleId = Integer.parseInt(roleIdStr);

		Role role=roleServiceImpl.findById(roleId);
		
		List<ModuleAcl> moduleAclList = moduleAclServiceImpl.findByRoleId(roleId);
		List<FunACL> funACList = funACLServiceImpl.searchByRoleId(roleId);
		
		//用于存储某角色的所有菜单
		List<Module> moduleList=new ArrayList<Module>();
		//某个角色的所有菜单访问控制列表
		for (int i = 0; i < moduleAclList.size(); i++) {
			Module module=moduleServiceImpl.findById(moduleAclList.get(i).getModId());
			moduleList.add(module);
			
		}
		
		//用于存储某角色没有的菜单
		
		List<Module> notModuleList=new ArrayList<Module>();
		List<ModuleAcl> notModuleAclList= moduleAclServiceImpl.findByRoleIdNotExist(roleId);
		for (int i = 0; i < notModuleAclList.size(); i++) {
			Module module=moduleServiceImpl.findById(notModuleAclList.get(i).getModId());
			if(module.getModParentId()==10){
				notModuleList.add(module);
			}else if(!notModuleList.contains(module))
			{
				notModuleList.add(module);
				
			}
		    
		}

		//用于存储某角色的所有功能
		List<ModuleFun> moduleFunList=new ArrayList<ModuleFun>();
		//某个角色的所有菜单访问控制列表
		for (int i = 0; i < funACList.size(); i++) {
			ModuleFun moduleFun=moduleFunServiceImpl.findById(funACList.get(i).getFunId());
			moduleFunList.add(moduleFun);
			
		}
       request.setAttribute("notModuleList", notModuleList);
		request.setAttribute("role", role);
		request.setAttribute("roleId", roleIdStr);
		request.setAttribute("moduleList", moduleList);
		request.setAttribute("moduleFunList", moduleFunList);
		request.getRequestDispatcher("/html/pms/label.jsp").forward(request,
				response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
