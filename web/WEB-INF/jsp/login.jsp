<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function doLogin() {
            $.ajax({
                cache: false,
                async: false,
                type: "POST",
                url: "/account/doLogin",
                data: $("#loginForm").serialize(),
                dataType: "json",
                success: function (retult) {
                    if (retult.resultInt) {
                        window.location.href = "/question/questionPage?page=1";
                    } else {
                        alert(retult.resultText);
                        window.location.href = "/account/login";
                    }
                },
                error: function () {
                }
            });
        }


    </script>
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>
</head>
<body>
<div class="container">

    <form class="form-signin" id="loginForm" onsubmit="return false">
        <h2 class="form-signin-heading">用户登录</h2>
        <input type="text" class="form-control" placeholder="Name" name="name">
        <input type="password" class="form-control" placeholder="Password" name="password">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住密码
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block"  onClick="doLogin();">登录</button>
    </form>

</div>
</body>
</html>
