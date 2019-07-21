<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.me.constant.Constants" %><%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/7/11
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
</head>
<body>

<c:set var="cancelStatus" value="<%=Constants.OrderStatus.CANCEL%>"/>
<c:set var="progressStatus" value="<%=Constants.OrderStatus.IN_PROGRESS%>"/>
<c:set var="overStatus" value="<%=Constants.OrderStatus.OVER%>"/>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>订单列表</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <div class="col-xs-4">
                        <select id="status" class="form-control field-input">
                            <option value="">-- 所有订单 --</option>
                            <c:if test="${not empty statusList}">
                                <c:forEach items="${statusList}" var="status">
                                    <option value="${status}">
                                        <c:choose>
                                            <c:when test="${cancelStatus eq status}">已取消</c:when>
                                            <c:when test="${progressStatus eq status}">进行中</c:when>
                                            <c:when test="${overStatus eq status}">交易完毕</c:when>
                                        </c:choose>
                                    </option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <br><br>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table id="orderTable" class="table table-hover table-striped table-condensed"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        initTable();
    });

    $("#status").on("change", function () {
        $("#orderTable").bootstrapTable("refresh");
    });

    function params() {
        return {
            status: $("#status").val()
        };
    }

    function initTable() {
        $("#orderTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/order/listOrderData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: params,
            pagination: true,
            pageNumber: 1,
            pageSize: 10,
            pageList: [10],
            sidePagination: 'client',
            uniqueId: 'orderId',
            undefinedText: "",
            columns: [
                {
                    field: 'tableName',
                    title: '牌桌名称',
                    align: 'center',
                    valign: 'middle',
                    width:'10%',
                    formatter: function (value, row, index) {
                        if ("<%=Constants.OrderStatus.OVER%>" === row.status) {
                            return "<a href='${pageContext.request.contextPath}/order/detail/"+ row.orderId +"' class='btn btn-link'>"+ value +"</a>";
                        } else {
                            return '<div style="padding: 6px 12px;">'+ value +'</div>';
                        }
                    }
                },
                {
                    field: 'startDateStr',
                    title: '开始时间',
                    align: 'center',
                    valign: 'middle',
                    width:'12%'
                },
                {
                    field: 'endDateStr',
                    title: '结束时间',
                    align: 'center',
                    valign: 'middle',
                    width:'12%'
                },
                {
                    field: 'totalMinute',
                    title: '总用时',
                    align: 'center',
                    valign: 'middle',
                    width:'16%',
                    formatter: function (value, row, index) {
                        if (!value || (!isNaN(value) && parseFloat(value) <= 0)) {
                            return "0";
                        }
                        var content = value + "分钟";
                        var totalHour = parseFloat(parseFloat(value) / 60).toFixed(2);
                        content += "(约<span class='field-star'>"+ totalHour +"</span>小时)";

                        return content;
                    }
                },
                {
                    field: 'evaluateCost',
                    title: '茶钱(元)',
                    align: 'center',
                    valign: 'middle',
                    width:'9%'
                },
                {
                    field: 'otherCost',
                    title: '其他费用(元)',
                    align: 'center',
                    valign: 'middle',
                    width:'7%'
                },
                {
                    field: 'amount',
                    title: '总计(元)',
                    align: 'center',
                    valign: 'middle',
                    width:'7%'
                },
                {
                    field: 'actualAmount',
                    title: '实收(元)',
                    align: 'center',
                    valign: 'middle',
                    width:'7%'
                },
                {
                    field: 'cashier',
                    title: '收银员',
                    align: 'center',
                    valign: 'middle',
                    width:'10%'
                },
                {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    valign: 'middle',
                    width:'10%',
                    formatter: function (value, row, index) {
                        if ("<%=Constants.OrderStatus.CANCEL%>" === value) {
                            return "已取消";
                        } else if ("<%=Constants.OrderStatus.OVER%>" === value) {
                            return "交易完毕";
                        } else if ("<%=Constants.OrderStatus.IN_PROGRESS%>" === value) {
                            return "进行中";
                        }
                    }
                }
            ]
        });
    }

</script>

</body>
</html>
