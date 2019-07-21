package com.me.service.impl;

import com.me.common.ResponseData;
import com.me.entity.Type;
import com.me.mapper.TypeMapper;
import com.me.service.TypeService;
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
public class TypeServiceImpl implements TypeService {

    private Logger logger = LoggerFactory.getLogger(CashierServiceImpl.class);

    @Autowired
    private TypeMapper typeMapper;

    public List<Type> listTypeData() {
        logger.debug("Execute Method listTypeData...");

        return typeMapper.listTypeData();
    }

    public void saveType(Type type) {
        logger.debug("Execute Method saveType...");

        type.setCreateDate(new Date());

        typeMapper.saveType(type);
    }

    public ResponseData deleteByTypeId(Integer typeId) {
        logger.debug("Execute Method deleteByTypeId...");

        boolean success = false;
        String message = "";

        try {
            typeMapper.deleteByTypeId(typeId);

            message = "删除成功。";
            success = true;
        } catch (Exception e) {
            logger.error("发生错误。", e);

            message = "删除异常，请重新操作。";
            success = false;
        }

        return new ResponseData(success, message);
    }

    public int countByName(String typeName) {
        logger.debug("Execute Method countByName...");

        return typeMapper.countByName(typeName);
    }
}
