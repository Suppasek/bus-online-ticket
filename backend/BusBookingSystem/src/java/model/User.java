/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class User {
    private String userId;
    private String password;
    
    public User() {
        
    }
    
    public User(String userId,String password) {
        
        this.userId = userId;
        this.password = password;
    }
    
    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void insertUser(String userId, String password) {
        
    }
    
}
