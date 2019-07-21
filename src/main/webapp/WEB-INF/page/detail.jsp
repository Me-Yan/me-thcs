<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/7/11
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>订单详情</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>订单详情</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <c:if test="${order.fromId ne null}">
                    <div class="col-xs-12 form-group-field text-center">从${table.name}(<span style="color: red;">${table.typeName}</span>)换到该桌</div>
                </c:if>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">牌桌名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.tableName}&nbsp;&nbsp;<span style="color: red;">(${order.typeName})</span></div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">开始时间 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.startDateStr}</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">结束时间 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.endDateStr}</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">消费时间 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.totalMinute}分钟&nbsp;&nbsp;(<span style="color: red;">约${order.totalHour}小时</span>)</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">预估费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.evaluateCost}</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">其他费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.otherCost}</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">总费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.amount}</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">实收（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.actualAmount}</div></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">收银员 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text"></div>${order.cashier}</div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">备注 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-4 col-md-4">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell"><div class="free-text">${order.note}</div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="action-btn-group">
                <a type="button" class="btn btn-info" href="${pageContext.request.contextPath}/order/listOrder">返回</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
