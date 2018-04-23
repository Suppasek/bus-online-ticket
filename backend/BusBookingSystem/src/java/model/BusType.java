/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Natsu
 */
public class BusType {
    private int typeId;
    private String typeName;
    private int seatAvailable;
    private float price;
    
    public BusType() {
        
    }

    public BusType(int typeId) throws ClassNotFoundException, SQLException {
        this.typeId = typeId;
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");       
        try (Connection conn = DriverManager.getConnection(sqllink, "root", "")) {
            PreparedStatement stmt = conn.prepareStatement("select * from bus_type where type_id = ?");
            stmt.setInt(1, typeId);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            typeName = rs.getString("typename");
            seatAvailable = rs.getInt("seat_available");
            price = rs.getFloat("price");
        }        
    }
    
    public BusType(String typeName, int seat_available, float price) {
        this.typeName = typeName;
        this.seatAvailable = seat_available;
        this.price = price;
    }
    
    public void insertBusType() throws ClassNotFoundException, SQLException {
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(sqllink, "root", "")) {
            PreparedStatement stmt = conn.prepareStatement("insert into bus_type(type_name, seat_available, price) values(?, ?, ?)");
            stmt.setString(1, typeName);
            stmt.setInt(2, seatAvailable);
            stmt.setFloat(3, price);
            stmt.executeUpdate();
        }
    } 

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getSeatAvailable() {
        return seatAvailable;
    }

    public void setSeatAvailable(int seatAvailable) {
        this.seatAvailable = seatAvailable;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
