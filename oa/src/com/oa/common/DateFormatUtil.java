package com.oa.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	public static void main(String[] args) {
		 Date time =DateFormatUtil.StringToShortDate("2012-01-01 ");
		 System.out.println(time);
		 System.out.println(DateFormatUtil.dateToShortString(time));
	}
	private static SimpleDateFormat shortsdf=new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat longsdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
	
	public static String dateToShortString(Date date){
		return shortsdf.format(date);
	}
	
	
	public static String dateToLongString(Date date){
		return longsdf.format(date);
	}
	
	
	public static Date StringToShortDate(String str){
		try {
			return shortsdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public static Date StringToLongDate(String str){
		try {
			return longsdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	

}
