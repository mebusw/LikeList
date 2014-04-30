package org.likelist.struts.action;

import java.text.SimpleDateFormat;

public class DateTimeUtil {

	private static SimpleDateFormat sdf = null;

	public static SimpleDateFormat getSimpleDateFormatInstance() {
		if (null == sdf) {
			sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		}
		return sdf;
	}

}
