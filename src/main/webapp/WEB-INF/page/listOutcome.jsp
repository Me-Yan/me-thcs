<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/7/12
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收支汇总</title>
</head>
<body>

<style>
    .table-item {
        height: 130px;
    }
    .item-body {
        text-align: center;
        font-size: 25px;
        font-weight: bold;
        line-height: 70px;
        color: red;
    }
</style>

<div class="page-content" style="max-width: 100%;">
    <div style="width: 1330px;margin: 0 auto;">
        <div class="table-item">
            <div class="table-item-name">
                <span>昨日收益</span>
            </div>
            <div class="line-dashed"></div>
            <div class="item-body">￥${yesterdayTotal}</div>
        </div>
        <div class="table-item">
            <div class="table-item-name">
                <span>近30天收益</span>
            </div>
            <div class="line-dashed"></div>
            <div class="item-body">￥${last30Total}</div>
        </div>
        <div class="table-item">
            <div class="table-item-name">
                <span>上个月收益</span>
            </div>
            <div class="line-dashed"></div>
            <div class="item-body">￥${lastMonthTotal}</div>
        </div>
    </div>

    <%-- 近30天收益 --%>
    <div class="page-content-section">
        <div class="page-section-title"><span>近30天收益</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12">
                    <div id="last30DayChart" style="height:500px;"></div>
                </div>
            </div>
        </div>
    </div>

    <%-- 上个月收益 --%>
    <div class="page-content-section">
        <div class="page-section-title"><span>上个月收益</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12">
                    <div id="lastMonthChart" style="height:500px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/plugins/echart/echarts.js"></script>
<script>

    $(function () {
       initChart();
    });

    var last30DayChart = echarts.init(document.getElementById('last30DayChart'));
    var lastMonthChart = echarts.init(document.getElementById('lastMonthChart'));

    function initChart() {
        /* 近30天收益 */
        var record30Data = JSON.parse('${last30ValueJson}');
        var record30DateData = JSON.parse('${last30DateJson}');

        var chart30Options = {
            tooltip: {
                trigger: 'axis'
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                name: '日期',
                boundaryGap: false,
                axisLabel: {
                    rotate: 20,
                    interval: 0
                },
                data: record30DateData
            },
            yAxis: {
                type: 'value',
                name: '收益（元）'
            },
            series: [
                {
                    name:'日期',
                    type:'line',
                    stack: '总量',
                    itemStyle : { normal: {label : {show: true}}},
                    data:record30Data,
                    markPoint: {
                        symbol: 'circle',
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ],
            noDataLoadingOption: {},
        };
        last30DayChart.showLoading();
        setTimeout(function () {
            last30DayChart.hideLoading();
            last30DayChart.setOption(chart30Options);
        }, 500);


        /* 上个月收益 */
        var recordData = JSON.parse('${lastMonthValueJson}');
        var recordDateData = JSON.parse('${lastMonthDateJson}');

        var chartOptions = {
            tooltip: {
                trigger: 'axis'
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                name: '日期',
                axisLabel: {
                    rotate: 20,
                    interval: 0
                },
                boundaryGap: false,
                data: recordDateData
            },
            yAxis: {
                type: 'value',
                name: '收益（元）'
            },
            series: [
                {
                    name:'日期',
                    type:'line',
                    stack: '总量',
                    itemStyle : { normal: {label : {show: true}}},
                    data:recordData,
                    markPoint: {
                        symbol: 'circle',
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ],
            noDataLoadingOption: {},
        };
        lastMonthChart.showLoading();
        setTimeout(function () {
            lastMonthChart.hideLoading();
            lastMonthChart.setOption(chartOptions);
        }, 500);
    }

</script>

</body>
</html>
