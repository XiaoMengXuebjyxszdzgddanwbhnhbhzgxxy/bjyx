package com.chixing.dao.impl;

import com.chixing.dao.CartDao;
import com.chixing.dao.DBConnection;
import com.chixing.pojo.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {
    @Override
    public boolean insertProduct2Cart(int productId,int customerId) {
        int rows = 0;
        //1. 连接数据库
        Connection connection = DBConnection.getConnection();
        PreparedStatement pstmt = null;

       String sql ="insert into cart (product_id,customer_id,add_time) values(?,?,?)";

        try {
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,productId);
            pstmt.setInt(2,customerId);
            pstmt.setDate(3,new java.sql.Date(new java.util.Date().getTime()));
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.closeConnection();
        }

        return rows>0;
    }

    @Override
    public List<Product> selectAllProduct(int customerId) {
        List<Product> productList = new ArrayList<>();

        //1. 连接数据库
        Connection connection = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="select cart_id,c.product_id,product_name,product_price,product_img,customer_id,add_time from cart c join product p on c.product_id = p.product_id where customer_id = ?";
        try {
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,customerId);
            rs =  pstmt.executeQuery();
            while(rs.next()){

                int productId = rs.getInt(2);
                String productName = rs.getString(3);
                float productPrice = rs.getFloat(4);
                String productImg = rs.getString(5);

               Product product = new Product(productId,productName,productPrice,productImg);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally { //5. 关闭数据库的连接等
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.closeConnection();

        }
        return productList;

    }
}
