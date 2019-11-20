<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="UTF-8">
<title>首页</title>


<!-- 导入bootstrap css js -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap-theme.css">
<!-- jQuery-->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">


</head>
<body>

<!-- 第一行的登录区域-->
<div class="container">
    <div class="row first-nav">
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-4"><a href="${pageContext.request.contextPath}/login.jsp">登录</a></div>
                <div class="col-md-4"><a href="">我的订单</a></div>
                <div class="col-md-4"><a href="">在线客服</a></div>
            </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>

</div>

<!-- 第二行的logo 与 搜索框-->
<div class="container">
    <div class="row logo-area">
        <!--网站logo-->
        <div class="col-md-2">logo区域</div>
        <div class="col-md-4"></div>
        <!--搜索框区域-->
        <div class="col-md-6">
            <input type="text" style="border-color: #5e5e5e" class="search-input"><!--搜索框-->
            <span></span> <!--搜索图标-->

        </div>
    </div>
</div>
<!-- 第三行的导航部分-->

<div class="container">
    <div class="row navi">
        <div class="col-md-3"> </div>
        <div class="col-md-6">
            <div class="row nav-main">
                <div class="col-md-2 home-nav"><a href="">首页</a></div>
                <div class="col-md-2"><a href="">居家用品</a></div>
                <div class="col-md-2"><a href="">小家电</a></div>
                <div class="col-md-2"><a href="">洗护</a></div>
                <div class="col-md-2"><a href="">厨具</a></div>
                <div class="col-md-2"><a href="">日用品</a></div>
            </div>
        </div>
        <div class="col-md-3"> </div>

    </div>
</div>


<!-- 第四行的 轮播图-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <!-- 共3张图-->
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>

    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner banner-img" role="listbox">
        <!-- 轮播图中的第一张图-->
        <div class="item active">
            <img src="${pageContext.request.contextPath}/images/1.jpg"  >
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <!-- 轮播图中的第2张图-->
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/2.jpg"  >
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <!-- 轮播图中的第3张图-->
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/3.jpg"  >
            <div class="carousel-caption">
                ...
            </div>
        </div>

    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- 热门商品的标题-->
<h3 class="hot-pro">热门商品</h3>



<!-- 第5部分 商品列表 ， 一行3个商品 row : 3个 col-md-4 -->
<div class="row pro-row">

    <c:forEach var="p" items="${productList}">
    <div class="col-md-4"  >
        <div class="thumbnail" >
            <a href=""> <img src="${pageContext.request.contextPath}/${p.productImg}"  ></a>
            <div class="caption">
                <span class="pro-desc" style="margin-left: 30px">${p.productName}</span>
                <span class="pro-desc" style="margin-left: 30px">${p.productPrice}元</span>
                <a class="pro-desc" style="margin-left: 100px" href="${pageContext.request.contextPath}/saveProduct2Cart?pid=${p.productId}">加入购物车</a>
            </div>
        </div>
    </div>
    </c:forEach>
    <%--<div class="col-md-4">
        <div class="thumbnail">
            <a href=""> <img src="${pageContext.request.contextPath}/images/6.PNG"  ></a>
            <div class="caption">
                <span class="pro-desc">商品简述</span>
                <a class="pro-desc" style="margin-left: 200px" href="">加入购物车</a>

            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="thumbnail">
            <a href=""> <img src="${pageContext.request.contextPath}/images/6.PNG"  ></a>
            <div class="caption">
                <span class="pro-desc">商品简述</span>
                <a class="pro-desc" style="margin-left: 200px" href="">加入购物车</a>

            </div>
        </div>
    </div>
</div>


<div class="row pro-row">
    <div class="col-md-4">
        <div class="thumbnail">
            <a href=""> <img src="${pageContext.request.contextPath}/images/6.PNG"  ></a>
            <div class="caption">
                <span class="pro-desc">商品简述</span>
                <a class="pro-desc" style="margin-left: 200px" href="">加入购物车</a>

            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="thumbnail">
            <a href=""> <img src="${pageContext.request.contextPath}/images/6.PNG"  ></a>
            <div class="caption">
                <span class="pro-desc">商品简述</span>
                <a class="pro-desc" style="margin-left: 200px" href="">加入购物车</a>

            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="thumbnail">
            <a href=""> <img src="${pageContext.request.contextPath}/images/6.PNG"  ></a>
            <div class="caption">
                <span class="pro-desc">商品简述</span>
                <a class="pro-desc" style="margin-left: 200px" href="">加入购物车</a>
            </div>
        </div>
    </div>--%>
</div>
  </body>
</html>