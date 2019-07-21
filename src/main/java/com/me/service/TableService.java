package com.me.service;

import com.me.common.ResponseData;
import com.me.entity.Order;
import com.me.entity.Table;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface TableService {

    List<Table> listTableData();

    List<Table> listValidData();

    void saveTable(Table table);

    ResponseData deleteByTableId(Integer tableId);

    int countByName(String name);

    List<Table> listTableInStatus(Integer tableId, String status);

    int countTableInStatus(Integer tableId, String status);

    Table confirmChange(Order order);

    Table getByTableId(Integer tableId);
}
