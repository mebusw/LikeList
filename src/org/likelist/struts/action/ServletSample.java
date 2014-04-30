package org.likelist.struts.action;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletSample extends HttpServlet { // 第一步： 扩展 HttpServlet 抽象类。

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // 第二步：重写doGet()方法

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		String myName = ""; // 第三步：获取HTTP 请求信息
		String key;
		PrintWriter out = response.getWriter();
		java.util.Enumeration keys = request.getParameterNames();
		while (keys.hasMoreElements()) {
			key = (String) keys.nextElement();
			if (key.equalsIgnoreCase("myName"))
				myName = request.getParameter(key);
		}
		if (myName == "")
			myName = "Hello";
		System.out.println("=" + myName);
		// 第四步：生成 HTTP 响应。
		response.setHeader("Pragma", "No-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-cache");
		//response.setContentType("text/html; charset=UTF-8");
		System.out.println(response.getContentType());
		
		
		//out.println("<head><meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf8\" /></head>");
		out.println("<body>");
		out.println("<h1>Just a 123 servlet</h1>");
		
		out.println("<p>" + myName
				+ ", this is a very basic servlet that writes an HTML page.</p>");
		String s= "<p>For instructions on running those samples on your WebSphere 服务器, "
			+ "open the page:</p>";
		out
				.println(s);
		out.println("</body></html>");
		out.write("你好");
		out.flush();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request, response);
	}
}