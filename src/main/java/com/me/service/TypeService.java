package com.me.service;

import com.me.common.ResponseData;
import com.me.entity.Cashier;
import com.me.entity.Type;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface TypeService {

    List<Type> listTypeData();

    void saveType(Type type);

    ResponseData deleteByTypeId(Integer typeId);

    int countByName(String typeName);
}
