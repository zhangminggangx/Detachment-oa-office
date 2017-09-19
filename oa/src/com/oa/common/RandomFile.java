package com.oa.common;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletContext;

import com.oa.deskTop.daoImpl.CommTypesDaoImpl;

public class RandomFile {
   public static String createFileName(){
	   Calendar calendar=Calendar.getInstance();
	   int year=calendar.get(Calendar.YEAR);
	   int month=calendar.get(Calendar.MONTH);
	   int day=calendar.get(Calendar.DAY_OF_MONTH);
	   int hour=calendar.get(Calendar.HOUR);
	   int minute=calendar.get(Calendar.MINUTE);
	   int second=calendar.get(Calendar.SECOND);
	   Random random=new Random();
	   int order=  random.nextInt(899)+100;
	   return year+""+month+""+day+""+hour+""+minute+""+second+order;
   }


  
}
