package com.oa.listenter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineListenter  implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("session创建");
		HttpSession session=event.getSession();
		ServletContext context=session.getServletContext();
		Integer onlineCount=(Integer)context.getAttribute("onlineCount");
		if(onlineCount!=null){
			onlineCount++;
			context.setAttribute("onlineCount", onlineCount);
		}else{
			onlineCount=1;
			context.setAttribute("onlineCount", onlineCount);
		}
		
		
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		System.out.println("session销毁");
		System.out.println("销毁session");
		HttpSession session=event.getSession();
	    ServletContext context=session.getServletContext();
	    Integer onlineCount=(Integer)context.getAttribute("onlineCount");
	    if(null!=onlineCount && onlineCount>=1){
		 onlineCount--;
		 context.setAttribute("onlineCount", onlineCount);
		
	    }

}
	}
