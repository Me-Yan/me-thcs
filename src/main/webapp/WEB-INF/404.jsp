<%--
  Created by IntelliJ IDEA.
  User: Me
  Date: 2019/07/11
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>404</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/404.css" />
</head>
<body>

<div class="dowebok error">
    <div class="container-fluid">
        <div class="col-xs-12 ground-color text-center">
            <div class="container-error-404">
                <div class="clip">
                    <div class="shadow">
                        <span class="digit thirdDigit">4</span>
                    </div>
                </div>
                <div class="clip">
                    <div class="shadow">
                        <span class="digit secondDigit">0</span>
                    </div>
                </div>
                <div class="clip">
                    <div class="shadow">
                        <span class="digit firstDigit">4</span>
                    </div>
                </div>
                <div class="msg">OH!
                    <span class="triangle"></span>
                </div>
            </div>
            <h2 class="h1">很抱歉，你访问的页面找不到了</h2>
            <p>
                <a class="tohome" href="${pageContext.request.contextPath}/main/index">返回首页</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>