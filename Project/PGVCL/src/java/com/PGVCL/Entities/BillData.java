
package com.PGVCL.Entities;

/**
 *
 * @author ghanshyam
 */
public class BillData {
    private int bill_id;
    private String u_id;
    private String username;
    private String number;
    private String address;
    private String year;
    private String month;
    private int amount;
    private String status;
    
    public BillData(){
        
    }

    public BillData(int bill_id, String u_id, String username, String number, String address, String year, String month, int amount, String status) {
        this.bill_id = bill_id;
        this.u_id = u_id;
        this.username = username;
        this.number = number;
        this.address = address;
        this.year = year;
        this.month = month;
        this.amount = amount;
        this.status = status;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
