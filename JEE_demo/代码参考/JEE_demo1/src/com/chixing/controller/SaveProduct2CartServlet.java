package com.chixing.controller;

import com.chixing.dao.CartDao;
import com.chixing.dao.impl.CartDaoImpl;
import com.chixing.pojo.Customer;
import com.chixing.pojo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SaveProduct2CartServlet  extends HttpServlet {

     protected void doPost (HttpServletRequest request, HttpServletResponse
        response) throws ServletException, IOException {


         //1. 获得页面中的商品id
         String productId = request.getParameter("pid");
         int pid = Integer.valueOf(productId);

         //2. 获得登录用户id
         HttpSession session = request.getSession();
         Customer customer = (Customer) session.getAttribute("loginCustomer");
         int customerId = customer.getCustomerId();

         //3. 添加商品到购物车中
         CartDao cartDao =  new CartDaoImpl();
         boolean result = cartDao.insertProduct2Cart(pid,customerId);

         //4. 执行查询【当前用户】购物车中所有商品
         List<Product> productList = cartDao.selectAllProduct(customerId);

         //5. 数据绑定
         request.setAttribute("productList",productList);
         request.getRequestDispatcher("/mycart.jsp").forward(request,response);


    }


    protected void doGet (HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        this.doPost(request,response);
    }




}
