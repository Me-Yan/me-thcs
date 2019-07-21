package com.me.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.me.common.ResponseData;
import com.me.constant.Constants;
import com.me.entity.Order;
import com.me.mapper.OrderMapper;
import com.me.mapper.TableMapper;
import com.me.service.OrderService;
import com.me.utils.CalculateUtil;
import com.me.utils.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2019/7/11.
 */
@Service
public class OrderServiceImpl implements OrderService {

    private Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private TableMapper tableMapper;

    public Order generateOrder(Integer tableId) {
        logger.debug("Execute Method generateOrder...");

        Date now = new Date();

        Order order = new Order();
        order.setTableId(tableId);
        order.setStartDate(now);
        order.setStatus(Constants.OrderStatus.IN_PROGRESS);
        order.setCreateDate(now);

        order.setStartDateStr(DateUtil.formatDate(now, "HH:mm"));

        tableMapper.updateStatusByTableId(tableId, Constants.TableStatus.IN_SERVICE);
        orderMapper.saveOrder(order);

        return order;
    }

    public Order overOrder(Integer orderId) {
        logger.debug("Execute Method overOrder...");

        Order order = orderMapper.getByOrderId(orderId);
        order.setOtherCost(0.0f);

        Date now = new Date();

        int diffMinute = DateUtil.diffMinute(order.getStartDate(), now);
        float diffHour = DateUtil.diffHour(order.getStartDate(), now);

        float evaluateCost = CalculateUtil.calculateMoney(diffMinute, diffHour);

        order.setEndDate(now);
        order.setEndDateStr(DateUtil.formatDate(now, "yyyy-MM-dd HH:mm"));
        order.setTotalMinute(diffMinute);
        order.setTotalHour(diffHour);
        order.setEvaluateCost(evaluateCost);
        order.setAmount(evaluateCost);
        order.setActualAmount(evaluateCost);

        return order;
    }

    public void confirmOver(Order order) {
        logger.debug("Execute Method confirmOver...");

        Date endDate = DateUtil.parseDate(order.getEndDateStr(), "yyyy-MM-dd HH:mm");

        order.setEndDate(endDate);
        order.setStatus(Constants.OrderStatus.OVER);

        orderMapper.updateOrder(order);
        tableMapper.updateStatusByTableId(order.getTableId(), Constants.TableStatus.VACANCY);
    }

    public void cancelOrder(Integer tableId) {
        logger.debug("Execute Method cancelOrder...");

        tableMapper.updateStatusByTableId(tableId, Constants.TableStatus.VACANCY);
        orderMapper.cancelOrder(tableId, Constants.OrderStatus.CANCEL, Constants.OrderStatus.IN_PROGRESS);
    }

    public List<Order> listOrderData(String status) {
        logger.debug("Execute Method listOrderData...");

        return orderMapper.listOrderData(status);
    }

    public Order getByOrderId(Integer orderId) {
        logger.debug("Execute Method getByOrderId...");

        Order order = orderMapper.getByOrderId(orderId);

        float diffHour = new BigDecimal(order.getTotalMinute()).divide(new BigDecimal(60), 2, RoundingMode.HALF_UP).floatValue();

        order.setTotalHour(diffHour);

        return orderMapper.getByOrderId(orderId);
    }

    public Float summaryToday() {
        logger.debug("Execute Method summaryYesterday...");

        BigDecimal total = new BigDecimal(0.0f);

        Date start = DateUtil.generateYesterdayEnd();
        Date end = DateUtil.generateTodayEnd();

        List<Order> orderList = orderMapper.listOrderInRange(start, end, Constants.OrderStatus.OVER);

        if (!CollectionUtils.isEmpty(orderList)) {
            for (Order order : orderList) {
                total = total.add(new BigDecimal(order.getActualAmount()));
            }
        }

        return total.floatValue();
    }

    public Float summaryYesterday() {
        logger.debug("Execute Method summaryYesterday...");

        BigDecimal total = new BigDecimal(0.0f);

        Date start = DateUtil.generateYesterdayStart();
        Date end = DateUtil.generateYesterdayEnd();

        List<Order> orderList = orderMapper.listOrderInRange(start, end, Constants.OrderStatus.OVER);

        if (!CollectionUtils.isEmpty(orderList)) {
            for (Order order : orderList) {
                total = total.add(new BigDecimal(order.getActualAmount()));
            }
        }

        return total.floatValue();
    }

    public Float summaryLastMonth() {
        logger.debug("Execute Method summaryLastMonth...");

        BigDecimal total = new BigDecimal(0.0f);

        Date start = DateUtil.generateLastMonthStart();
        Date end = DateUtil.generateLastMonthEnd();

        List<Order> orderList = orderMapper.listOrderInRange(start, end, Constants.OrderStatus.OVER);

        if (!CollectionUtils.isEmpty(orderList)) {
            for (Order order : orderList) {
                total = total.add(new BigDecimal(order.getActualAmount()));
            }
        }

        return total.floatValue();
    }

    public Float summaryLast30Days() {
        logger.debug("Execute Method summaryLast30Days...");

        BigDecimal total = new BigDecimal(0.0f);

        Date start = DateUtil.generateLast30Start();
        Date end = DateUtil.generateYesterdayEnd();

        List<Order> orderList = orderMapper.listOrderInRange(start, end, Constants.OrderStatus.OVER);

        if (!CollectionUtils.isEmpty(orderList)) {
            for (Order order : orderList) {
                total = total.add(new BigDecimal(order.getActualAmount()));
            }
        }

        return total.floatValue();
    }

    public String listLastMonth() {
        logger.debug("Execute Method listLastMonth...");

        Date start = DateUtil.generateLastMonthStart();
        Date end = DateUtil.generateLastMonthEnd();

        List<Order> orderList = orderMapper.listOrderInRange(start, end, Constants.OrderStatus.OVER);
        Map<String, Float> model = getLastMap(orderList);

        String dataJson = generateDataJson(model, start, end);

        return dataJson;
    }

    public String list30Days() {
        logger.debug("Execute Method list30Days...");

        Date start = DateUtil.generateLast30Start();
        Date end = DateUtil.generateYesterdayEnd();

        List<Order> orderList = orderMapper.listOrderInRange(start, end, Constants.OrderStatus.OVER);
        Map<String, Float> model = getLastMap(orderList);

        String dataJson = generateDataJson(model, start, end);

        return dataJson;
    }

    public String generateDateLastMonth() {
        logger.debug("Execute Method generateDateLastMonth...");

        Date start = DateUtil.generateLastMonthStart();
        Date end = DateUtil.generateLastMonthEnd();

        return generateDateJson(start, end);
    }

    public String generateDateLast30() {
        logger.debug("Execute Method generateDateLast30...");

        Date start = DateUtil.generateLast30Start();
        Date end = DateUtil.generateYesterdayEnd();

        return generateDateJson(start, end);
    }

    private Map<String, Float> getLastMap(List<Order> orderList) {
        logger.debug("Execute Method getLastMap...");

        Map<String, Float> model = Maps.newHashMap();

        if (!CollectionUtils.isEmpty(orderList)) {
            for (Order order : orderList) {
                String dateStr = order.getStartDateStr();

                Float temp = 0.0f;
                if (model.containsKey(dateStr)) {
                    temp = model.get(dateStr);
                }

                float total = new BigDecimal(temp).add(new BigDecimal(order.getActualAmount())).floatValue();

                model.put(dateStr, total);
            }
        }

        return model;
    }

    private String generateDateJson(Date start, Date end) {
        List<String> dateList = Lists.newArrayList();

        while(start.before(end)) {
            String dateStr = DateUtil.formatDate(start, "yyyy-MM-dd");
            dateList.add(dateStr);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(start);
            calendar.add(Calendar.DAY_OF_MONTH, 1);

            start = calendar.getTime();
        }

        return new Gson().toJson(dateList);
    }

    private String generateDataJson(Map<String, Float> data, Date start, Date end) {
        List<Float> dataList = Lists.newArrayList();

        while(start.before(end)) {
            String dateStr = DateUtil.formatDate(start, "yyyy-MM-dd");

            Float value = data.get(dateStr);
            dataList.add(value);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(start);
            calendar.add(Calendar.DAY_OF_MONTH, 1);

            start = calendar.getTime();
        }

        return new Gson().toJson(dataList);
    }
}
