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
    <title>结账</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>结账</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <form:form modelAttribute="orderForm" id="orderForm" name="orderForm" action="${pageContext.request.contextPath}/order/confirmOver" method="post">
                <form:hidden path="orderId" />
                <form:hidden path="tableId" />
                <form:hidden path="endDateStr" />
                <form:hidden path="totalMinute" />
                <form:hidden path="evaluateCost" id="evaluateCost"/>
                
                <div class="row">
                    <c:if test="${orderForm.fromId ne null}">
                        <div class="col-xs-12 form-group-field text-center">从${table.name}(<span style="color: red;">${table.typeName}</span>)换到该桌</div>
                    </c:if>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">牌桌名称 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">${orderForm.tableName}&nbsp;&nbsp;<span style="color: red;">(${orderForm.typeName})</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">开始时间 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell"><fmt:formatDate value="${orderForm.startDate}" pattern="HH:mm"/> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">结束时间 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell"><fmt:formatDate value="${orderForm.endDate}" pattern="HH:mm"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">消费时间 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">${orderForm.totalMinute}分钟&nbsp;&nbsp;(<span style="color: red;">约${orderForm.totalHour}小时</span>)</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">预估费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">${orderForm.evaluateCost}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">其他费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="otherCost" class="form-control field-input" id="otherCost" maxlength="10" />
                                    <span class="text-error hide" name="otherCostMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">总费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <span id="amountShow">${orderForm.amount}</span>
                                    <form:hidden path="amount" id="amount" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">结算费用（元） <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="actualAmount" class="form-control field-input" id="actualAmount" maxlength="10" />
                                    <span class="text-error hide" name="actualAmountMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">收银员 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <c:if test="${not empty cashierList}">
                                        <c:forEach items="${cashierList}" var="cashier">
                                            <form:radiobutton path="cashier" label="${cashier.name}" value="${cashier.name}" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:forEach>
                                    </c:if>
                                    <span class="text-error hide" name="cashierMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">备注 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:textarea path="note" class="form-control field-input" id="note" maxlength="250" cssStyle="height: 200px;resize: none;"></form:textarea>
                                    <span class="text-error hide" name="noteMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
            <div class="action-btn-group">
                <a type="button" class="btn btn-info" href="${pageContext.request.contextPath}/main/index">返回</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" id="btnSubmit">提交</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="outcomeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p id="tipContent">确定完结交易？</p>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btnConfirm">确定</button>
            </div>
        </div>
    </div>
</div>

<script>

    var formValidation;
    $(function () {
        initValidation();

        formValidation = $("#orderForm").data("formValidation");
    });

    function checkFloat(money) {
        if (isNaN(money)) {
            money = 0.0;
        } else {
            var index = money.indexOf(".");
            if (index == 0) {
                money = "0" + money;
                index++;
            }
            if (index != -1) {
                money = money.substring(0, parseInt(index)+3);
            }
        }

        return money;
    }

    $("#actualAmount").on("change", function () {
        var value = $(this).val();
        value = checkFloat(value);

        $(this).val(value);
    });

    $("#otherCost").on("change", function () {
        var evaluateCost = $("#evaluateCost").val();
        var otherCost = $(this).val();

        if (isNaN(otherCost)) {
            $(this).val("0.0");
            $("#amountShow").text(evaluateCost);
            $("#amount").val(evaluateCost);
            $("#actualAmount").val(evaluateCost);
        } else {
            var index = otherCost.indexOf(".");
            if (index == 0) {
                otherCost = "0" + otherCost;
                index++;
            }
            if (index != -1) {
                otherCost = otherCost.substring(0, parseInt(index)+3);
            }

            $("#otherCost").val(otherCost);
            var amount = parseFloat(parseFloat(otherCost) + parseFloat(evaluateCost)).toFixed(2);

            $("#amountShow").text(amount);
            $("#amount").val(amount);
            $("#actualAmount").val(amount);
        }
    });

    $("#btnSubmit").on("click", function () {
        formValidation.validate();
        if (formValidation.isValid()) {
            $("#outcomeModal").modal("show");
        }
    });

    $("#btnConfirm").on("click", function () {
        var form = document.getElementById("orderForm");
        form.submit();
    });

    function initValidation() {
        $("#orderForm").formValidation({
            excluded: [':disabled'],
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            err: {
                container: function($field, validator) {
                    var messageName = $($field).attr("name")+"Message";
                    var messageNode  = $('#orderForm').find($("span[name='"+messageName+"']"));
                    messageNode.addClass("has-error");
                    messageNode.removeClass("hide");
                    return messageNode;
                }
            },
            row: {
                valid: 'has-success',
                invalid: 'has-error',
                feedback: 'has-feedback'
            },
            icon: {
                valid: null,
                invalid: null,
                validating: null
            },
            fields: {
                otherCost:{
                    message: '请填写其他费用。',
                    validators: {
                        notEmpty: {
                            message: '请填写其他费用。'
                        }
                    }
                },
                actualAmount:{
                    message: '请填写实际消费。',
                    validators: {
                        notEmpty: {
                            message: '请填写实际消费。'
                        }
                    }
                },
                cashier:{
                    message: '请选择收银员。',
                    validators: {
                        notEmpty: {
                            message: '请选择收银员。'
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {
            $("#orderForm").find("i.form-control-feedback").remove();

            if($(data.element).is('select')) {
                $(data.element).next().addClass("has-error");
                $(data.element).next().removeClass("has-success");
            }
            else if($(data.element).is('textarea')) {
                $(data.element).parent().addClass("has-error");
                $(data.element).parent().removeClass("has-success");
            }
            else {
                $(data.element).addClass("has-error");
                $(data.element).removeClass("has-success");
            }
        }).on('success.field.fv', function(e, data) {
//            $("#btnUserSubmit").removeAttr("disabled");
            if($(data.element).is('select')) {
                $(data.element).next().removeClass("has-error");
                $(data.element).next().addClass("has-success");
            }
            else if($(data.element).is('textarea')) {
                $(data.element).parent().removeClass("has-error");
                $(data.element).parent().addClass("has-success");
            }
            else {
                $(data.element).removeClass("has-error");
                $(data.element).addClass("has-success");
            }
            $("#orderForm").find("."+data.field+"Message").css("display","none");
            $("#orderForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#orderForm").find("i.form-control-feedback").remove();
        });
    }
</script>

</body>
</html>
