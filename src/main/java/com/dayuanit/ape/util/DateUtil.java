package com.dayuanit.ape.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.dayuanit.ape.exception.BusException;


public class DateUtil {
	
	public static final String PATTERN_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
	public static final String PATTERN_YYYY_MM_DD_HHMMSS = "yyyy-MM-dd HH:mm:ss";
	public static final String PATTERN_YYYY_MM_DD = "yyyy-MM-dd";
	
	public static Date add(Date date, int minute) {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, minute);
		return calendar.getTime();
	}
	
	public static Date addByMonth(Date date, int month) {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, month);
		return calendar.getTime();
	}
	
	public static Date sub(Date date, int minute) {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, -minute);
		return calendar.getTime();
	}
	
	public static String dateToString(Date date, String pattern) {
		return new SimpleDateFormat(pattern).format(date);
	}
	
	/**
	 * 默认使用yyyy-MM-dd HH:mm:ss格式
	 * @param date
	 * @return
	 */
	public static String dateTimeToString(Date date) {
		return new SimpleDateFormat(PATTERN_YYYY_MM_DD_HHMMSS).format(date);
	}
	
	/**
	 * 默认使用yyyy-MM-dd HH:mm:ss格式
	 * @return
	 */
	public static Date stringToDateTime(String dateTime) {
		SimpleDateFormat sdf = new SimpleDateFormat(PATTERN_YYYY_MM_DD_HHMMSS);
		try {
			return sdf.parse(dateTime);
		} catch (ParseException e) {
			throw new BusException("格式化时间错误");
		}
	}
	
	/**
	 * 默认使用yyyy-MM-dd格式
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date) {
		return new SimpleDateFormat(PATTERN_YYYY_MM_DD).format(date);
	}
	
	public static Date stringToDate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat(PATTERN_YYYY_MM_DD);  
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			throw new BusException("格式化时间错误");
		}
	}
	
//	public static Date stringToDate(String pattern) {
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟    
//		Date date = null;
//		try {
//			date = sdf.parse(pattern);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		return date; 
//	}
	
	//false代表已过期，true代表的是未过期。
	public boolean deadTime(Date date) {
		if(new Date().getTime()-date.getTime()>0) {
			return false;
		}
		else{
			return true;
		}
	}
	
	public static String dateToString1(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss:SSS");  
		String str = sdf.format(date); 
		return str;
	}
	
	public static void main(String[] args) {
		//Date date = DateUtil.sub(new Date(), 30);
		//System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date));
//	   Date date = DateUtil.stringToDate("2015-09-09");
//	   String str = date.toString();
//	   System.out.println(str);
	    
	}
}
