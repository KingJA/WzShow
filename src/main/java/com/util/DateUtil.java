package com.util;

import java.text.SimpleDateFormat;


/**
 * Date Util
 * 
 * @author cbb
 * 
 */
public class DateUtil {
	public static String getDateTime(Object date){
		if(date==null) return "";
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return f.format(date);
	}
}
