
package com.PGVCL.Helper;

import java.sql.*;
/**
 *
 * @author ghanshyam
 */
public class ConnectionProvider {
    private static Connection conn;
    
    public static Connection getConnection(){
        try{
            
            if(conn==null){
                //load
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                //connection
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pgvcl","root","shyam");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
}
