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
import java.sql.Timestamp;

/**
 *
 * @author Natsu
 */
public class Order {
    private int paymentId;
    private String type;
    private float amount;
    private Timestamp paymentTime;
    
    public Order() {
        
    }
    
    /**
     *
     * @param type
     * @param amount
     */
    public Order(String type, float amount) {
        this.type = type;
        this.amount = amount;
        paymentTime = new Timestamp(new java.util.Date().getTime());
    }
    
    public void insertOrder() throws ClassNotFoundException, SQLException {
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(sqllink, "root", "")) {
            PreparedStatement stmt = conn.prepareStatement("insert into payment(type, amount, payment_time) values(?, ?, ?)");
            stmt.setString(1, type);
            stmt.setFloat(2, amount);
            stmt.setTimestamp(3, paymentTime);
            stmt.executeUpdate();
        }
    }
 
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Timestamp getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Timestamp paymentTime) {
        this.paymentTime = paymentTime;
    }
    
}
