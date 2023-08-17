
package com.PGVCL.Dao;

import com.PGVCL.Entities.Rates;
import com.PGVCL.Entities.User;
import java.sql.*;

/**
 *
 * @author ghanshyam
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    //method to insert user data :
    public Boolean insertUser(User user)
    {
         boolean f=false;
        try
        {   
           
            String query="insert into user(username,email,address,number,password,type,status) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(query) ;
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getAddress());
            pstmt.setString(4, user.getNumber());
            pstmt.setString(5, user.getPassword());
            pstmt.setString(6, user.getType());
            pstmt.setString(7, user.getStatus());
            
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    //method to update user data :
    public Boolean updateUser(User user)
    {
        boolean f=false;
        try
        {   
           
            String query="update user set username=? , email=? , address=? , number=? , password=? where id=?";
            PreparedStatement pstmt=this.con.prepareStatement(query) ;
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getAddress());
            pstmt.setString(4, user.getNumber());
            pstmt.setString(5, user.getPassword());
            pstmt.setInt(6, user.getId());

            
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    //get user by user number and password
    public User getUserByNumberAndPassword(String number,String password,String type)
    {
        User user=null;
        
        try
        {
            String query="select * from user where number=? and password=? and type=?";
            PreparedStatement pstm=con.prepareStatement(query);
            
            pstm.setString(1, number);
            pstm.setString(2,password);
            pstm.setString(3, type);
            
            ResultSet set=pstm.executeQuery();
            
            if(set.next())
            {
                user=new User();
                
                user.setId(set.getInt("id"));
                user.setUsername(set.getString("username"));
                user.setEmail(set.getString("email"));
                user.setAddress(set.getString("address"));
                user.setNumber(set.getString("number"));
                user.setPassword(set.getString("password"));
                user.setType(set.getString("type"));
                user.setStatus(set.getString("status"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean checkUserExist(String number)
    {
        boolean check=false;
        
         try
        {
            String query="select number from user where number=?";
            PreparedStatement pstm=con.prepareStatement(query);
            
            pstm.setString(1, number);
            
            ResultSet set=pstm.executeQuery();
            
            if(set.next())
            {
                check=true;
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }    
        
        
        return check;
    }
    
    //get Rates
    
    public Rates getRates()
    {
        Rates rates=null;
              
        try
        {
            String query="select * from Rates";
            PreparedStatement pstm=con.prepareStatement(query);
            ResultSet set=pstm.executeQuery();
            
            if(set.next())
            {
                rates=new Rates();
               
                rates.setUnit_Less_Than_Hundread(set.getString("u_les_100"));
                rates.setUnit_Between_Hundread_To_Two_Hundread(set.getString("u_gre_100_les_200"));
                rates.setUnit_Between_Two_Hundread_to_Three_Hundread(set.getString("u_gre_200_les_300"));
                rates.setUnit_Greater_Than_Three_Hundread(set.getString("u_gre_300"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return rates;
    }
    
    //method to update rates :
    public Boolean updateRates(Rates rates) 
    {
        boolean f = false;
        try 
        {
            String query = "update rates set u_les_100=? , u_gre_100_les_200=? , u_gre_200_les_300=? , u_gre_300=? where u_id=1";
            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setString(1, rates.getUnit_Less_Than_Hundread());
            pstmt.setString(2, rates.getUnit_Between_Hundread_To_Two_Hundread());
            pstmt.setString(3, rates.getUnit_Between_Two_Hundread_to_Three_Hundread());
            pstmt.setString(4, rates.getUnit_Greater_Than_Three_Hundread());

            pstmt.executeUpdate();
            
            f = true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return f;
    }

}
