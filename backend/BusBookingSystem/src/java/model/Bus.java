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
public class Bus {
    private int busId;
    private String licensePlate;
    private int busTypeId;
    private BusType busType;
    
    public Bus() {
        
    }

    public Bus(int busId) throws ClassNotFoundException, SQLException {
        this.busId = busId;
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(sqllink, "root", "");
        PreparedStatement stmt = conn.prepareStatement("select bus_id, license_plate, bus_type_tid"
                + " from bus where bus_id = ?");
        stmt.setInt(1, busId);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        licensePlate = rs.getString("license_plate");
        busType = new BusType(rs.getInt("bus_type_tid"));      
    }
    
    public Bus(String licensePlate, int busTypeId) {
        this.licensePlate = licensePlate;
        this.busTypeId = busTypeId;
    }
    
    public void addBus() throws ClassNotFoundException, SQLException {
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(sqllink, "root", "");
        PreparedStatement stmt = conn.prepareStatement("insert into bus(bus_type_tid, license_plate) values(?, ?)");     
        stmt.setInt(1, busTypeId);
        stmt.setString(2, licensePlate);
        stmt.executeUpdate();
    }
    
        public void addSeat(int seatAvailable, int routeId, int busId) throws ClassNotFoundException, SQLException {
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(sqllink, "root", "")) {
            String query = "insert into bus_seat(seat_number, route_rid, bus_bid) values(?, ?, ?)";
            
            for(int i=2;i<=seatAvailable;i++) {
                query += ", (?, ?, ?)";
            }
            
            PreparedStatement stmt = conn.prepareStatement(query);
            int seatCount = 1;
            
            for(int i=1;i<seatAvailable*3;i+=3) {
                stmt.setInt(i, seatCount);
                stmt.setInt(i+1, routeId );
                stmt.setInt(i+2, busId);
                seatCount+=1;
            }
            
            stmt.executeUpdate();
        }
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public int getBusTypeId() {
        return busTypeId;
    }

    public void setBusTypeId(int busTypeId) {
        this.busTypeId = busTypeId;
    }

    public BusType getBusType() {
        return busType;
    }

    public void setBusType(BusType busType) {
        this.busType = busType;
    }
}
