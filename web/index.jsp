<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>介么办</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="/img/head_default.jpg">
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script >
        /*完全显示iframe* 实际中使用变量bHeight可以正好得到完整的高度，如有需要可以使用dHeight，并得到两者的最大值，
        但实际应用中使用dHeight，只是记录每一次得到的最大值，会带来一些问题。具体应用还是看需求吧/
         */
        function reinitIframe() {
            var iframe = document.getElementById("urlIframe");
            try
            {
                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                /*
                 var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                 var height = Math.max(bHeight, dHeight);
                 iframe.height = height;                */
                iframe.height = bHeight;
            }
            catch (ex) { }
        }


    </script>
</head>

<body>

<div class="container">

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="brand" href="#"></a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="/account/register">注册</a></li>
                    <li><a href="/account/login">登录</a></li>
                    <li><a href="/question/detail/17">详情</a></li>
                    <li><a href="/main/a" target="myframe">跳转A</a></li>
                    <li><a href="/main/b" target="myframe">跳转B</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>




   <%-- <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/img/lunbo1.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="/img/lunbo2.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="/img/lunbo3.jpg" alt="Third slide">
            </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
--%>

    <iframe name="myframe" src="/main/a" frameborder="0" scrolling="no" width="100%" height="100%" id="urlIframe" onload="reinitIframe()" ></iframe>
</div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->



</body>
</html>
