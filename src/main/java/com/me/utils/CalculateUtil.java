package com.me.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Created by Me on 2019/7/11.
 */
public class CalculateUtil {

    private static final int price = 15;

    public static float calculateMoney(int minute, float hour) {
        BigDecimal minuteObj = new BigDecimal(hour);
        BigDecimal priceObj = new BigDecimal(price);

        return minuteObj.multiply(priceObj).setScale(2, RoundingMode.HALF_UP).floatValue();
    }
}
