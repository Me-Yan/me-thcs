package com.me.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2019/7/11.
 */
public class Cashier implements Serializable {

    private static final long serialVersionUID = -88394386397256805L;

    private Integer cashierId;
    private String name;
    private Date createDate;

    // 功能逻辑
    private String createDateStr;

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public Integer getCashierId() {
        return cashierId;
    }

    public void setCashierId(Integer cashierId) {
        this.cashierId = cashierId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
