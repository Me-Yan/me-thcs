<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/7/11
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>换桌</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>换桌</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <form:form modelAttribute="orderForm" id="orderForm" name="orderForm" action="${pageContext.request.contextPath}/table/confirmChange" method="post">
                <form:hidden path="fromId" />

                <div class="row">
                    <div class="col-xs-12 form-group-field text-center"><span class="field-star">以下是空闲的牌桌</span></div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">牌桌 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:select path="tableId" class="form-control field-input" id="tableId">
                                        <form:option value="">-- 请选择牌桌 --</form:option>
                                        <c:if test="${not empty tableList}">
                                            <c:forEach items="${tableList}" var="table">
                                                <form:option value="${table.tableId}">${table.name}(<span style="color: red;">${table.typeName}</span>)</form:option>
                                            </c:forEach>
                                        </c:if>
                                    </form:select>
                                    <span class="text-error hide" name="tableIdMessage"></span>
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
                <p id="tipContent">确定切换到该牌桌吗？</p>
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
                tableId:{
                    message: '请选择牌桌。',
                    validators: {
                        notEmpty: {
                            message: '请选择牌桌。'
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
