package com.me.service;

import com.me.common.ResponseData;
import com.me.entity.Cashier;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface CashierService {

    List<Cashier> listCashierData();

    void saveCashier(Cashier cashier);

    ResponseData deleteByCashierId(Integer cashierId);

    int countByName(String name);
}
