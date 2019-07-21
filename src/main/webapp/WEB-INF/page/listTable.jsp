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
    <title>牌桌列表</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>牌桌列表</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <a href="${pageContext.request.contextPath}/table/addTable" class="btn btn-primary">添加</a>
                </div>
                <br><br>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table id="tableTable" class="table table-hover table-striped table-condensed"></table>
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
                <p>确定删除该牌桌？</p>
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

    // 删除牌桌
    function deleteModal(tableId) {
        deleteId = tableId;
        $("#deleteModal").modal("show");
    }
    $("#btnDelete").on("click", function () {
        $("#deleteModal").modal("hide");
        $("body").loading("请稍等。。。");
        $.ajax({
            url: "${pageContext.request.contextPath}/table/deleteTable",
            type: "post",
            data: {
                tableId: deleteId
            },
            success: function (result) {
                $("body").loading("hide");
                if (result.success) {
                    $("#tipContent").html(result.message);
                    $("#tableTable").bootstrapTable("refresh");
                } else {
                    $("#tipContent").html(result.message);
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    function initTable() {
        $("#tableTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/table/listTableData',
            method: 'POST',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: {},
            pagination: true,
            pageNumber: 1,
            pageSize: 20,
            pageList: [20],
            sidePagination: 'client',
            uniqueId: 'tableId',
            columns: [
                {
                    field: 'name',
                    title: '姓名',
                    align: 'center',
                    valign: 'middle',
                    width:'20%'
                },
                {
                    field: 'typeName',
                    title: '类型',
                    align: 'center',
                    valign: 'middle',
                    width:'10%'
                },
                {
                    field: 'note',
                    title: '备注',
                    align: 'center',
                    valign: 'middle',
                    width:'30%'
                },
                {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    valign: 'middle',
                    width:'10%',
                    formatter: function (value, row, index) {
                        if ("<%=Constants.TableStatus.VACANCY%>" === value) {
                            return "空闲";
                        } else if ("<%=Constants.TableStatus.IN_SERVICE%>" === value) {
                            return "服务中";
                        } else if ("<%=Constants.TableStatus.DELETED%>" === value) {
                            return "已被删除";
                        }
                    }
                },
                {
                    field: 'createDateStr',
                    title: '创建时间',
                    align: 'center',
                    valign: 'middle',
                    width:'15%'
                },
                {
                    field: '',
                    title: '操作',
                    align: 'center',
                    valign: 'middle',
                    width:'15%',
                    formatter: function (value, row, index) {

                        var content = '<div class="btn-group"><button type="button" class="btn btn-danger" onclick="deleteModal('+row.tableId+')">删除</button></div>';

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
