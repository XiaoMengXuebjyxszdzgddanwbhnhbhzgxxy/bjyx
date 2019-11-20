package com.chixing.controller;

import com.chixing.dao.ProdcuctDao;
import com.chixing.dao.impl.ProdcuctDaoImpl;
import com.chixing.pojo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductAllServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdcuctDao dao = new ProdcuctDaoImpl();
       List<Product> productList = dao.selectAll();
       request.setAttribute("productList",productList);
       request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
