package com.me.mapper;


import com.me.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface OrderMapper {

    void saveOrder(Order order);

    Order getByOrderId(Integer orderId);

    Order getByTableId(@Param("tableId") Integer tableId, @Param("inServiceStatus") String inServiceStatus);

    void updateOrder(Order order);

    void cancelOrder(@Param("tableId") Integer tableId, @Param("cancelStatus") String cancelStatus, @Param("inServiceStatus") String inServiceStatus);

    void updateStatusByTableId(@Param("tableId") Integer tableId, @Param("status") String status, @Param("inServiceStatus") String inServiceStatus);

    List<Order> listOrderData(@Param("status") String status);

    List<Order> listOrderInRange(@Param("start") Date start, @Param("end") Date end, @Param("status") String status);

}
