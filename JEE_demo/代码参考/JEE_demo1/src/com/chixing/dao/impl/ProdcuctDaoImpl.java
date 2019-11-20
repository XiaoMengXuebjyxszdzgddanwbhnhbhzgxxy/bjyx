package com.chixing.dao.impl;

import com.chixing.dao.DBConnection;
import com.chixing.dao.ProdcuctDao;
import com.chixing.pojo.Customer;
import com.chixing.pojo.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdcuctDaoImpl implements ProdcuctDao {
    @Override
    public List<Product> selectAll() {
        List<Product> productList = new ArrayList<>();
        //1. 连接数据库
        Connection connection = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //2. 执行SQL
        String sql ="select product_id,product_name,product_price,product_img from product";
        try {
            pstmt = connection.prepareStatement(sql);

            //3. 获得结果
            rs = pstmt.executeQuery();
            //4. 封装结果
            while(rs.next()){
                int productId = rs.getInt(1);
                String productName = rs.getString(2);
                float productPrice = rs.getFloat(3);
                String productImg = rs.getString(4);

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
