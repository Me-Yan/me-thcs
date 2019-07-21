package com.me.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2019/7/11.
 */
public class Order implements Serializable {

    private static final long serialVersionUID = -7735151540144310121L;

    private Integer orderId;
    private Integer tableId;
    private Integer fromId;
    private Date startDate;
    private Date endDate;
    private Integer totalMinute;
    private String cashier;
    private Float evaluateCost;
    private Float otherCost;
    private Float amount;
    private Float actualAmount;
    private String note;
    private String status;
    private Date createDate;

    // 功能逻辑
    private String tableName;
    private String typeName;
    private String startDateStr;
    private String endDateStr;
    private String createDateStr;
    private Float totalHour;

    public Float getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(Float actualAmount) {
        this.actualAmount = actualAmount;
    }

    public Float getTotalHour() {
        return totalHour;
    }

    public void setTotalHour(Float totalHour) {
        this.totalHour = totalHour;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    public Integer getFromId() {
        return fromId;
    }

    public void setFromId(Integer fromId) {
        this.fromId = fromId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getTotalMinute() {
        return totalMinute;
    }

    public void setTotalMinute(Integer totalMinute) {
        this.totalMinute = totalMinute;
    }

    public String getCashier() {
        return cashier;
    }

    public void setCashier(String cashier) {
        this.cashier = cashier;
    }

    public Float getEvaluateCost() {
        return evaluateCost;
    }

    public void setEvaluateCost(Float evaluateCost) {
        this.evaluateCost = evaluateCost;
    }

    public Float getOtherCost() {
        return otherCost;
    }

    public void setOtherCost(Float otherCost) {
        this.otherCost = otherCost;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getStartDateStr() {
        return startDateStr;
    }

    public void setStartDateStr(String startDateStr) {
        this.startDateStr = startDateStr;
    }

    public String getEndDateStr() {
        return endDateStr;
    }

    public void setEndDateStr(String endDateStr) {
        this.endDateStr = endDateStr;
    }
}
