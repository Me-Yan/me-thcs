package com.me.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class DateUtil {

    private static Logger logger = LoggerFactory.getLogger(DateUtil.class);

    public static String formatDate(Date date, String pattern) {
        logger.debug("Execute Method formatDate...");

        DateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            return dateFormat.format(date);
        } catch (Exception e) {
            logger.error("occur a error when format date");
            return null;
        }
    }

    public static Date parseDate(String date, String pattern) {
        logger.debug("Execute Method parseDate...");

        DateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            return dateFormat.parse(date);
        } catch (Exception e) {
            logger.error("occur a error when parse date");
            return null;
        }
    }

    public static int diffMinute(Date startDate, Date endDate) {
        long startTime = startDate.getTime();
        long endTime = endDate.getTime();

        return Long.valueOf((endTime - startTime) / 1000 / 60).intValue();
    }

    public static float diffHour(Date startDate, Date endDate) {
        int totalMinute = diffMinute(startDate, endDate);
        BigDecimal temp = new BigDecimal(totalMinute);

        return temp.divide(new BigDecimal(60), 2, RoundingMode.HALF_UP).floatValue();
    }

    public static Date generateYesterdayStart() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        calendar.add(Calendar.DAY_OF_MONTH, -1);

        return calendar.getTime();
    }

    public static Date generateTodayEnd() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        calendar.add(Calendar.MONTH, 1);

        return calendar.getTime();
    }

    public static Date generateYesterdayEnd() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        return calendar.getTime();
    }

    public static Date generateLastMonthStart() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.DAY_OF_MONTH, 1);

        calendar.add(Calendar.MONTH, -1);

        return calendar.getTime();
    }

    public static Date generateLastMonthEnd() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.DAY_OF_MONTH, 1);

        return calendar.getTime();
    }

    public static Date generateLast30Start() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        calendar.add(Calendar.DAY_OF_MONTH, -30);

        return calendar.getTime();
    }

}
