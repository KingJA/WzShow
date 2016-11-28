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
	public static String getYearDay(Object date){
		if(date==null) return "";
		SimpleDateFormat f=new SimpleDateFormat("yyyy年MM月dd日");
		return f.format(date);
	}
}
