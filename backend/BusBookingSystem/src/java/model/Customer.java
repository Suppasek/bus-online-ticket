/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mysql.jdbc.Driver;

/**
 *
 * @author Natsu
 */
public class Customer extends User{
    public Customer() {
        
    }
    
    public void insertCustomer(String userId, String password, String firstname, String lastname, String phone, String email) throws SQLException, ClassNotFoundException {
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(sqllink, "root", "");
        PreparedStatement stmt = conn.prepareStatement("insert into user values(?, ?, ?, ?, ?, ?, ?)");
        stmt.setString(1, userId);
        stmt.setString(2, password);
        stmt.setString(3, firstname);
        stmt.setString(4, lastname);
        stmt.setString(5, email);
        stmt.setString(6, phone);
        stmt.setString(7, "customer");
        stmt.executeUpdate();
        
    }
    
}
