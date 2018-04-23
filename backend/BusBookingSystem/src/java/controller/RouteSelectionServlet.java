/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.BusTable;

/**
 *
 * @author Natsu
 */
@WebServlet(name = "RouteSelectionServlet", urlPatterns = {"/RouteSelectionServlet"})
public class RouteSelectionServlet extends HttpServlet {

    private Connection conn;

    @Override
    public void init() {
        conn = (Connection) getServletContext().getAttribute("Connection");
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            RequestDispatcher obj;

            if (session.getAttribute("status").equals("guest")) {
                request.setAttribute("log", "wrongstatus");
                obj = request.getRequestDispatcher("index.jsp");
                obj.forward(request, response);
            } else if ((session.getAttribute("status")).equals("customer")) {
                PreparedStatement stmt = conn.prepareStatement("select route_id, leaving_date, leaving_time, departures, destinations, typename, price, bus_bid, seat_available"
                        + " from bus_table join bus on (bus_table.bus_bid = bus.bus_id) join bus_type on (bus.bus_type_tid = bus_type.type_id)"
                        + "where route_id = ?");
                stmt.setInt(1, Integer.parseInt(request.getParameter("selectedroute")));
                ResultSet rs = stmt.executeQuery();
                rs.next();
                BusTable table = new BusTable(rs.getString("departures"), rs.getString("destinations"), rs.getDate("leaving_date"), rs.getInt("bus_bid"), rs.getTime("leaving_time")
                , rs.getInt("price"), rs.getInt("route_id"), rs.getInt("seat_available"));
                session.setAttribute("route", table);
                obj = request.getRequestDispatcher("seat_selection.jsp");
                obj.forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RouteSelectionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RouteSelectionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
