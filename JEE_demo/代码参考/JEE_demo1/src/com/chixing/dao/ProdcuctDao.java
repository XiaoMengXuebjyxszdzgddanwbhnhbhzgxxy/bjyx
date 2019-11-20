package com.chixing.dao;

import com.chixing.pojo.Product;

import java.util.List;

public interface ProdcuctDao {
    //查看所有商品
  public List<Product> selectAll();
 }
