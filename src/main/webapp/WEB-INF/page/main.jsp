<%@ page import="com.me.constant.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/7/11
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>茶坊</title>
</head>
<body>

<c:set var="vacancyStatus" value="<%=Constants.TableStatus.VACANCY%>"/>
<c:set var="inServiceStatus" value="<%=Constants.TableStatus.IN_SERVICE%>"/>
<c:set var="deletedStatus" value="<%=Constants.TableStatus.DELETED%>"/>

<div class="page-content" style="max-width: 1780px;">
    <c:if test="${not empty tableList}">
        <c:forEach items="${tableList}" var="table">
            <div class="table-item">
                <div class="table-item-name">
                    <span>${table.name}</span>
                    <span style="font-size: 13px;color: red;">(${table.typeName})</span>
                </div>
                <div class="line-dashed"></div>
                <div class="item-body">
                    <div class="start-time" id="start-${table.tableId}">
                        <c:if test="${inServiceStatus eq table.status}">
                            开始时间：<span>${table.startTimeStr}</span>
                        </c:if>
                    </div>

                    <div class="item-action text-center" id="item-${table.tableId}">
                        <c:choose>
                            <c:when test="${vacancyStatus eq table.status}">
                                <div class="action-inner">&nbsp;</div>
                                <div class="action-inner"><a class="btn btn-info" href="${pageContext.request.contextPath}/order/generateOrder/${table.tableId}">迎客</a></div>
                                <div class="action-inner">&nbsp;</div>
                            </c:when>
                            <c:when test="${inServiceStatus eq table.status}">
                                <div class="action-inner"><a class="btn btn-danger" href="${pageContext.request.contextPath}/order/cancelOrder/${table.tableId}">取消</a></div>
                                <div class="action-inner"><button class="btn btn-info" onclick="changeTable('${table.tableId}')">换桌</button></div>
                                <div class="action-inner"><a href="${pageContext.request.contextPath}/order/overOrder/${table.orderId}" class="btn btn-success">结账</a></div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

<jsp:include page="./common/commonModal.jsp"/>

<script>

    function changeTable(tableId) {
        $.ajax({
            url: "${pageContext.request.contextPath}/table/checkIsVacancyTable",
            type: "post",
            data: {
                tableId: tableId
            },
            success: function (result) {
                if (result>0) {
                    window.location.href = "${pageContext.request.contextPath}/table/changeTable/" + tableId;
                } else {
                    $("#tipContent").html("已没有空置的牌桌。");
                    $("#outcomeModal").modal("show");
                }
            }
        });
    }

    var message = "${message}";
    if (message) {
        $("#tipContent").html(message);
        $("#outcomeModal").modal("show");
    }

</script>

</body>
</html>
