package com.me.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2019/7/11.
 */
public class Type implements Serializable {

    private static final long serialVersionUID = 3432881909843279332L;

    private Integer typeId;
    private String typeName;
    private Date createDate;

    // 功能逻辑
    private String createDateStr;

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
