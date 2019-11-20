<%--
  Created by IntelliJ IDEA.
  User: qianghj
  Date: 2019/11/18
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="${pageContext.request.contextPath}/css/mycart.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- 全部商品 -->
    <div class="cart-filter-bar"> 全部商品  </div>
    <!-- 大导航 -->
    <div class="nav">
        <div class="check-box-all">
            <input type="checkbox"><span  >全选</span>
            <span class="cart-tip">商品</span>
        </div>
        <div class="menu-item">
            <span class="cart-tip">单价</span>
            <span class="cart-tip">数量</span>
            <span class="cart-tip">小计</span>
            <span class="cart-tip">操作</span>
        </div>
    </div>

    <!--商品列表-->
    <ul class="product-item">
        <c:forEach var="p" items="${productList}">
            <li>
                <div class="product-info">
                    <input type="checkbox">
                    <a href="">
                        <img src="${p.productImg}" >
                    </a>
                    <a href="" >
                        <div class="product-desc">${p.productName}</div>
                    </a>
                </div>
                <div  class="price-info">
                    <span>￥</span><span>${p.productPrice}</span>
                    <input type="button" value="-">
                    <input type="button" value="1">
                    <input type="button" value="+">
                    <span class="xiaoji-price">￥</span><span>400</span>
                    <a href="" class="delete-btn">删除</a>

                </div>
            </li>

        </c:forEach>


    </ul>


    <!--总计-->
    <div class="go-pay">
        <a class="go-pay-btn" href="">去结算</a>
    </div>

</div>
</body>
</html>
