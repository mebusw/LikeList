package org.likelist.struts.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.likelist.type.Role;

public abstract class AttrParser {
	/**
	 * check if session attributes "userId" & "role" are matched and valid.
	 * 
	 * @param request
	 * @return userId
	 */
	public static int getUid(HttpServletRequest request) {
		Object attr;
		int uid = -1;
		if (null != (attr = request.getSession().getAttribute("userId"))) {
			uid = (Integer) attr;
		}
		Role role = null;
		if (null != (attr = request.getSession().getAttribute("role"))) {
			role = (Role) attr;
		}
		if (Role.USER != role)
			uid = -1;
		return uid;
	}

	public static String getUserName(HttpServletRequest request) {
		Object attr;
		String userName = null;
		if (null != (attr = request.getSession().getAttribute("fullName"))) {
			userName = (String) attr;
		}
		return userName;
	}

	/**
	 * check if session attributes "bizId" & "role" are matched and valid.
	 * 
	 * @param request
	 * @return bizId
	 */
	public static int getBid(HttpServletRequest request) {
		Object attr;
		int bid = -1;
		if (null != (attr = request.getSession().getAttribute("bizId"))) {
			bid = (Integer) attr;
		}
		Role role = null;
		if (null != (attr = request.getSession().getAttribute("role"))) {
			role = (Role) attr;
		}
		if (Role.BIZ != role)
			bid = -1;
		return bid;
	}

	/**
	 * check if session attributes "adminId" & "role" are matched and valid.
	 * 
	 * @param request
	 * @return bizId
	 */
	public static int getAid(HttpServletRequest request) {
		Object attr;
		int aid = -1;
		if (null != (attr = request.getSession().getAttribute("adminId"))) {
			aid = (Integer) attr;
		}
		Role role = null;
		if (null != (attr = request.getSession().getAttribute("role"))) {
			role = (Role) attr;
		}
		if (Role.ADMIN != role)
			aid = -1;
		return aid;
	}

	public static int getParaInt(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		return Integer.parseInt(_para);

	}

	public static String getParaStr(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		return _para;
	}

	public static float getParaFloat(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		return Float.parseFloat(_para);
	}

	public static double getParaDouble(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		return Double.parseDouble(_para);
	}

	/**
	 * 
	 * @param request
	 * @param para MM/dd/yyyy
	 * @return
	 * @throws Exception para string is null
	 * @throws ParseException para string is not MM/dd/yyyy format
	 */
	public static Date getParaDate(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

		try {
			return sdf.parse(_para);
		} catch (ParseException e) {
			throw e;
		}
	}

	/**
	 * 
	 * @param request
	 * @param para MM/dd/yyyy HH:mm:ss
	 * @return
	 * @throws Exception para string is null
	 * @throws ParseException para string is not MM/dd/yyyy HH:mm:ss format
	 */
	public static Date getParaDateTime(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

		try {
			return sdf.parse(_para);
		} catch (ParseException e) {
			throw e;
		}
	}

	public static boolean getParaBool(HttpServletRequest request, String para)
			throws Exception {
		String _para = request.getParameter(para);
		if (null == _para)
			throw new Exception("Missing request parameter: \"" + para + "=\"");
		return Boolean.parseBoolean(_para);
	}

}
