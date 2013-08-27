package com.xticfc.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	/**
	 * 返回java.sql.Date类型的当前时间
	 * @return
	 */
	public static java.sql.Date getSqlDate(){
		return getSqlDate(new java.util.Date());
	}
	
	/**
	 * 返回java.sql.Date类型的时间
	 * @param date
	 * @return
	 */
	public static java.sql.Date getSqlDate(java.util.Date date){
		return new java.sql.Date(date.getTime());
	}
	
	/**
	 * 以"yyyy-MM-dd"格式来格式化日期
	 * @param date
	 * @return
	 */
	public static String formatFromDate(Date date){
		return formatFromDate("yyyy-MM-dd", date);
	}
	
	
	/**
	 * 按照给定的格式，格式化日期
	 * @param formater	需要的格式，常用的例如"yy-MM-dd HH:mm:ss"
	 * @param date  日期
	 * @return
	 */
	public static String formatFromDate(String formater, Date date){
		DateFormat df = new SimpleDateFormat(formater);
		return df.format(date);
	}
	
	
	/**
	 * 按照给定的格式，格式化日期
	 * @param formater	需要的格式，常用的例如"yy-MM-dd HH:mm:ss"
	 * @param s  可格式化为日期的字符串
	 * @return
	 */
	public static String formatFromString(String formater, String s){
		DateFormat df = new SimpleDateFormat(formater);
		return df.format(s);
	}
	
	public static void main(String[] args) {
		System.out.println(formatFromString("yyyy-MM-dd", "2012-01-05"));
	}
	/**
	 * 字符串转化为日期</br>
	 * @param str	需要被转换为日期的字符串
	 * @param format 格式，常用的为 yyyy-MM-dd HH:mm:ss
	 * @return	java.util.Date，如果出错会返回null
	 */
	public static Date StringToDate(String str, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * 计算两个日期之间的天数</br>
	 * 任何一个参数传空都会返回-1</br>
	 * 返回两个日期的时间差，不关心两个日期的先后</br>
	 * @param dateStart
	 * @param dateEnd
	 * @return
	 */
	public static long getDaysBetweenTwoDate(Date dateStart, Date dateEnd){
		if(null == dateStart || null == dateEnd){
			return -1;
		}
		long l = Math.abs(dateStart.getTime() - dateEnd.getTime());
		l = l/1000*60*60*24l;
		return l;
	}
}
