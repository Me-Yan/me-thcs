<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="web-header">
    <div class="header-content">
        <div class="system-name"><a href="${pageContext.request.contextPath}/main/index">茶坊</a></div>
        <div style="float: left;text-align: center;width: 200px;color: red;padding-top: 8px;margin-left: 170px;">今日收益：${todayTotal}元</div>
        <div class="user-action" style="padding-top: 8px;">
            <a href="${pageContext.request.contextPath}/order/listOrder">历史交易</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/outcome/summary">收支汇总</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/cashier/listCashier">收银员管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/type/listType">牌桌类型管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/table/listTable">牌桌管理</a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>