/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

/**
 *
 * @author Natsu
 */
public class BusTable {

    private int routeId;
    private String departures;
    private String destinations;
    private Date leavingDate;
    private Time leavingTime;
    private int seatAvailable;
    private int busId;
    private Bus bus;

    public BusTable() {

    }

    public BusTable(String departures, String destinations, Date leavingDate, int busId, Time leavingTime, int price, int routeId, int seatAvailable) throws ClassNotFoundException, SQLException {
        this.departures = departures;
        this.destinations = destinations;
        this.leavingDate = leavingDate;
        this.leavingTime = leavingTime;
        this.routeId = routeId;
        this.seatAvailable = seatAvailable;
        bus = new Bus(busId);
    }

    public BusTable(String departures, String destinations, Date leavingDate, int busId, Time leavingTime) throws ClassNotFoundException, SQLException {
        this.departures = departures;
        this.destinations = destinations;
        this.leavingDate = leavingDate;
        this.leavingTime = leavingTime;
        this.busId = busId;
        bus = new Bus(busId);
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    public void insertTable() throws SQLException, ClassNotFoundException {
        String sqllink = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull";
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(sqllink, "root", "")) {
            PreparedStatement stmt = conn.prepareStatement("insert into bus_table(leaving_date, leaving_time, departures, destinations, bus_bid) values(?, ?, ?, ?, ?)");
            stmt.setDate(1, getLeavingDate());
            stmt.setTime(2, getLeavingTime());
            stmt.setString(3, getDepartures());
            stmt.setString(4, getDestinations());
            stmt.setInt(5, busId);
            stmt.executeUpdate();
            ResultSet rs = stmt.executeQuery("select max(route_id) from bus_table");
            rs.next();
            setRouteId(rs.getInt("max(route_id)"));
            rs = stmt.executeQuery("select seat_available from bus_type where type_id = (select bus_type_tid from bus where bus_id =" + busId + ")");
            bus = new Bus();
            rs.next();
            setSeatAvailable(rs.getInt("seat_available"));
            bus.addSeat(getSeatAvailable(), getRouteId(), busId);
            conn.close();
        }
    }

    public int getSeatAvailable() {
        return seatAvailable;
    }

    public void setSeatAvailable(int seatAvailable) {
        this.seatAvailable = seatAvailable;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getDepartures() {
        return departures;
    }

    public void setDepartures(String departures) {
        this.departures = departures;
    }

    public String getDestinations() {
        return destinations;
    }

    public void setDestinations(String destinations) {
        this.destinations = destinations;
    }

    public Date getLeavingDate() {
        return leavingDate;
    }

    public void setLeavingDate(Date leavingDate) {
        this.leavingDate = leavingDate;
    }

    public Time getLeavingTime() {
        return leavingTime;
    }

    public void setLeavingTime(Time leavingTime) {
        this.leavingTime = leavingTime;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

}
