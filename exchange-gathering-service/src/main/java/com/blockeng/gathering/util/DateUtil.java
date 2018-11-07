package com.blockeng.gathering.util;

import javax.xml.crypto.Data;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    public static Date getLastNDaysDate(int n){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -n); //得到前一天
        Date date = calendar.getTime();
        return date;
    }


    public static Date getTodayZeroTime(){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date zero = calendar.getTime();
        return zero;
    }

    public static Date getTodayZeroTimeBeforeNDay(int n){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.add(Calendar.DATE,-n);
        Date resultDate=calendar.getTime();
        return resultDate;
    }
}
