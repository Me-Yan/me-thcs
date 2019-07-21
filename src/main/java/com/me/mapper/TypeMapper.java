package com.me.mapper;

import com.me.entity.Type;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface TypeMapper {

    List<Type> listTypeData();

    void saveType(Type type);

    void deleteByTypeId(Integer typeId);

    int countByName(String typeName);
}
