package com.chixing.dao;

import com.chixing.pojo.Cart;
import com.chixing.pojo.Product;

import java.util.List;

public interface CartDao {
    public boolean insertProduct2Cart(int productId,int customerId);
    public List<Product> selectAllProduct(int customerId);
}
