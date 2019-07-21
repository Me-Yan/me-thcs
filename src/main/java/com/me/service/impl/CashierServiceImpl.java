package com.me.service.impl;

import com.me.common.ResponseData;
import com.me.entity.Cashier;
import com.me.mapper.CashierMapper;
import com.me.service.CashierService;
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
public class CashierServiceImpl implements CashierService {

    private Logger logger = LoggerFactory.getLogger(CashierServiceImpl.class);

    @Autowired
    private CashierMapper cashierMapper;

    public List<Cashier> listCashierData() {
        logger.debug("Execute Method listCashierData...");

        return cashierMapper.listCashierData();
    }

    public void saveCashier(Cashier cashier) {
        logger.debug("Execute Method saveCashier...");

        cashier.setCreateDate(new Date());

        cashierMapper.saveCashier(cashier);
    }

    public ResponseData deleteByCashierId(Integer cashierId) {
        logger.debug("Execute Method deleteByCashierId...");

        boolean success = false;
        String message = "";

        try {
            cashierMapper.deleteByCashierId(cashierId);

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

        return cashierMapper.countByName(name);
    }
}
