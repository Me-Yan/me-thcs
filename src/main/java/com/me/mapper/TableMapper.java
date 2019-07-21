package com.me.mapper;

import com.me.entity.Table;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2019/7/11.
 */
public interface TableMapper {

    List<Table> listTableData(@Param("excludeTableStatus") String excludeTableStatus);

    List<Table> listValidData(@Param("excludeTableStatus") String excludeTableStatus, @Param("validStatus") String validStatus);

    void saveTable(Table table);

    void deleteByTableId(@Param("tableId") Integer tableId, @Param("deletedStatus") String deletedStatus);

    int countByName(@Param("name") String name, @Param("invalidStatus") String invalidStatus);

    void updateStatusByTableId(@Param("tableId") Integer tableId, @Param("status") String status);

    List<Table> listTableInStatus(@Param("tableId") Integer tableId, @Param("status") String status);

    int countTableInStatus(@Param("tableId") Integer tableId, @Param("status") String status);

    Table getByTableId(Integer tableId);

}
