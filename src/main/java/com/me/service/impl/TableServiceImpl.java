package com.me.service.impl;

import com.me.common.ResponseData;
import com.me.constant.Constants;
import com.me.entity.Order;
import com.me.entity.Table;
import com.me.mapper.OrderMapper;
import com.me.mapper.TableMapper;
import com.me.service.TableService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
@Service
public class TableServiceImpl implements TableService {

    private Logger logger = LoggerFactory.getLogger(TableServiceImpl.class);

    @Autowired
    private TableMapper tableMapper;
    @Autowired
    private OrderMapper orderMapper;

    public List<Table> listTableData() {
        logger.debug("Execute Method listTableData...");

        return tableMapper.listTableData(Constants.TableStatus.DELETED);
    }

    public List<Table> listValidData() {
        logger.debug("Execute Method listValidData...");

        return tableMapper.listValidData(Constants.TableStatus.DELETED, Constants.OrderStatus.IN_PROGRESS);
    }

    public void saveTable(Table table) {
        logger.debug("Execute Method saveTable...");

        table.setCreateDate(new Date());
        table.setStatus(Constants.TableStatus.VACANCY);

        tableMapper.saveTable(table);
    }

    public ResponseData deleteByTableId(Integer tableId) {
        logger.debug("Execute Method deleteByTableId...");

        boolean success = false;
        String message = "";

        try {
            tableMapper.deleteByTableId(tableId, Constants.TableStatus.DELETED);

            message = "删除成功。";
            success = true;
        } catch (Exception e) {
            logger.error("发生错误。", e);

            message = "删除异常，请重新操作。";
            success = false;
        }

        return new ResponseData(success, message);
    }

    public int countByName(String name) {
        logger.debug("Execute Method countByName...");

        return tableMapper.countByName(name, Constants.TableStatus.DELETED);
    }

    public List<Table> listTableInStatus(Integer tableId, String status) {
        logger.debug("Execute Method listTableInStatus...");

        return tableMapper.listTableInStatus(tableId, status);
    }

    public int countTableInStatus(Integer tableId, String status) {
        logger.debug("Execute Method countTableInStatus...");

        return tableMapper.countTableInStatus(tableId, status);
    }

    public Table confirmChange(Order order) {
        logger.debug("Execute Method confirmChange...");

        Order prevOrder = orderMapper.getByTableId(order.getFromId(), Constants.OrderStatus.IN_PROGRESS);

        Date now = new Date();

        order.setStartDate(prevOrder.getStartDate());
        order.setStatus(Constants.OrderStatus.IN_PROGRESS);
        order.setCreateDate(now);

        tableMapper.updateStatusByTableId(order.getFromId(), Constants.TableStatus.VACANCY);
        tableMapper.updateStatusByTableId(order.getTableId(), Constants.TableStatus.IN_SERVICE);

        orderMapper.updateStatusByTableId(order.getFromId(), Constants.OrderStatus.CANCEL, Constants.OrderStatus.IN_PROGRESS);
        orderMapper.saveOrder(order);

        return tableMapper.getByTableId(order.getTableId());
    }

    public Table getByTableId(Integer tableId) {
        logger.debug("Execute Method getByTableId...");

        return tableMapper.getByTableId(tableId);
    }

}
