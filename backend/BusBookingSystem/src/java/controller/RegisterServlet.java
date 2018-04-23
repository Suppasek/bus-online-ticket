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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.User;

/**
 *
 * @author Natsu
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    
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
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String userId = request.getParameter("username");
            String password = request.getParameter("password");
            String firstname = request.getParameter("first_name");
            String lastname = request.getParameter("last_name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            
            Statement stmt = conn.createStatement();
            PreparedStatement ps = conn.prepareStatement("select * from user where user_id=?");  
            ps.setString(1,userId);
            ResultSet rs = ps.executeQuery();
            
            RequestDispatcher obj = request.getRequestDispatcher("register.jsp");
            if (userId.length() > 12){
                request.setAttribute("log", "username ต้องสั้นกว่า 12 ตัวอักษร");
            }
            else if (userId.length() < 4) {
                request.setAttribute("log", "username ต้องยาวกว่า 4 ตัวอักษร");
            }
            else if (password.length() > 8){
                request.setAttribute("log", "password ต้องสั้นกว่า 8 ตัวอักษร");
            }
            else if (password.length() < 4) {
                request.setAttribute("log", "password ต้องยาวกว่า 4 ตัวอักษร");
            }
            else if (phone.length() != 10) {
                request.setAttribute("log", "โปรดใส่เบอร์โทรศัพท์ที่ถูกต้อง");
            }
            else if(rs.next()) {
                request.setAttribute("log", "username นี้มีคนใช้แล้ว");
            }
            else {
                Customer user = new Customer();
                try {
                    user.insertCustomer(userId, password, firstname, lastname, phone, email);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("log", "complete");
                obj = request.getRequestDispatcher("index.jsp");
            }
            obj.forward(request, response);
            
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
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
