package com.me.service;

import com.me.common.ResponseData;
import com.me.entity.Order;

import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2019/7/11.
 */
public interface OrderService {

    Order generateOrder(Integer tableId);

    Order overOrder(Integer orderId);

    void confirmOver(Order order);

    void cancelOrder(Integer tableId);

    List<Order> listOrderData(String status);

    Order getByOrderId(Integer orderId);

    Float summaryToday();

    Float summaryYesterday();

    Float summaryLastMonth();

    Float summaryLast30Days();

    String listLastMonth();

    String list30Days();

    String generateDateLastMonth();

    String generateDateLast30();

}
