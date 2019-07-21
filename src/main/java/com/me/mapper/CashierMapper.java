package com.me.mapper;

import com.me.entity.Cashier;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface CashierMapper {

    List<Cashier> listCashierData();

    void saveCashier(Cashier cashier);

    void deleteByCashierId(Integer cashierId);

    int countByName(String name);
}
