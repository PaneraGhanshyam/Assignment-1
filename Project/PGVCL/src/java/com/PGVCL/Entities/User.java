package com.PGVCL.Entities;

/**
 *
 * @author ghanshyam
 */
public class User {
   private int id;
   private String username;
   private String email;
   private String address;
   private String number;
   private String password;
   private String type;
   private String status;

    public User(int id, String username, String email, String address, String number, String password, String type, String status) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.address = address;
        this.number = number;
        this.password = password;
        this.type = type;
        this.status = status;
    }

    public User(String username, String email, String address, String number, String password, String type, String status) {
        this.username = username;
        this.email = email;
        this.address = address;
        this.number = number;
        this.password = password;
        this.type = type;
        this.status = status;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
