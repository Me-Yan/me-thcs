<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>添加收银员</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>添加收银员</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <form:form modelAttribute="cashierForm" id="cashierForm" name="cashierForm" action="${pageContext.request.contextPath}/cashier/confirmCashier" method="post">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-sm-offset-3 col-md-offset-3 control-label text-left">姓名 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-4 col-md-4">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="name" class="form-control field-input" id="name" maxlength="10" />
                                    <span class="text-error hide" name="nameMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
            <div class="action-btn-group">
                <button type="button" class="btn btn-primary" id="btnSubmit">提交</button>
            </div>
        </div>
    </div>
</div>

<script>

    var formValidation;
    $(function () {
        initValidation();

        formValidation = $("#cashierForm").data("formValidation");
    });



    $("#btnSubmit").on("click", function () {
        formValidation.validate();
        if (formValidation.isValid()) {
            var form = document.getElementById("cashierForm");
            form.submit();
        }
    });

    function initValidation() {
        $("#cashierForm").formValidation({
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
                    var messageNode  = $('#cashierForm').find($("span[name='"+messageName+"']"));
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
                name:{
                    message: '请输入姓名。',
                    validators: {
                        notEmpty: {
                            message: '请输入姓名。'
                        },
                        callback: {
                            callback: function (value, validator, $field) {
                                if (value) {
                                    value = $.trim(value);
                                } else {
                                    return true;
                                }
                                var flag = false;
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/cashier/checkCashier",
                                    type: "post",
                                    data: {
                                        name: value
                                    },
                                    async: false,
                                    success: function (result) {
                                        if (result>0) {
                                            flag = false;
                                        } else {
                                            flag = true;
                                        }
                                    }
                                });
                                if (!flag) {
                                    return {
                                        valid: false,
                                        message: "该收银员已存在。"
                                    };
                                }
                                return true;
                            }
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {
            $("#cashierForm").find("i.form-control-feedback").remove();

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
            $("#cashierForm").find("."+data.field+"Message").css("display","none");
            $("#cashierForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#cashierForm").find("i.form-control-feedback").remove();
        });
    }
</script>

</body>
</html>
