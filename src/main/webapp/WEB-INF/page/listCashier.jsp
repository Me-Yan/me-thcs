<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/7/11
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收银员列表</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>收银员列表</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <a href="${pageContext.request.contextPath}/cashier/addCashier" class="btn btn-primary">添加</a>
                </div>
                <br><br>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table id="cashierTable" class="table table-hover table-striped table-condensed"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="./common/commonModal.jsp"/>

<%-- 删除收银员 --%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>确定删除该收银员？</p>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-primary" id="btnDelete">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    var deleteId;
    $(function () {
        initTable();
    });

    // 删除收银员
    function deleteModal(cashierId) {
        deleteId = cashierId;
        $("#deleteModal").modal("show");
    }
    $("#btnDelete").on("click", function () {
        $("#deleteModal").modal("hide");
        $("body").loading("请稍等。。。");
        $.ajax({
            url: "${pageContext.request.contextPath}/cashier/deleteCashier",
            type: "post",
            data: {
                cashierId: deleteId
            },
            success: function (result) {
                $("body").loading("hide");
                if (result.success) {
                    $("#tipContent").html(result.message);
                    $("#cashierTable").bootstrapTable("refresh");
                } else {
                    $("#tipContent").html(result.message);
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    function initTable() {
        $("#cashierTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/cashier/listCashierData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: {},
            pagination: true,
            pageNumber: 1,
            pageSize: 10,
            pageList: [10],
            sidePagination: 'client',
            uniqueId: 'cashierId',
            columns: [
                {
                    field: 'name',
                    title: '姓名',
                    align: 'center',
                    valign: 'middle',
                    width:'40%'
                },
                {
                    field: 'createDateStr',
                    title: '创建时间',
                    align: 'center',
                    valign: 'middle',
                    width:'40%'
                },
                {
                    field: '',
                    title: '操作',
                    align: 'center',
                    valign: 'middle',
                    width:'20%',
                    formatter: function (value, row, index) {

                        var content = '<div class="btn-group"><button type="button" class="btn btn-danger" onclick="deleteModal('+row.cashierId+')">删除</button></div>';

                        return content;
                    }
                }
            ]
        });
    }

    var message = "${message}";
    if (message) {
        $("#tipContent").text(message);
        $("#outcomeModal").modal("show");
    }

</script>

</body>
</html>
