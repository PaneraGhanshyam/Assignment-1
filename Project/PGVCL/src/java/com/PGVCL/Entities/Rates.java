
package com.PGVCL.Entities;

/**
 *
 * @author ghanshyam
 */
public class Rates {

    private String unit_Less_Than_Hundread;
    private String unit_Between_Hundread_To_Two_Hundread;
    private String unit_Between_Two_Hundread_to_Three_Hundread;
    private String unit_Greater_Than_Three_Hundread;

    public Rates(String unit_Less_Than_Hundread, String unit_Between_Hundread_To_Two_Hundread, String unit_Between_Two_Hundread_to_Three_Hundread, String unit_Greater_Than_Three_Hundread) {
        this.unit_Less_Than_Hundread = unit_Less_Than_Hundread;
        this.unit_Between_Hundread_To_Two_Hundread = unit_Between_Hundread_To_Two_Hundread;
        this.unit_Between_Two_Hundread_to_Three_Hundread = unit_Between_Two_Hundread_to_Three_Hundread;
        this.unit_Greater_Than_Three_Hundread = unit_Greater_Than_Three_Hundread;
    }
    
    
    public Rates()
    {
        
    }

    public String getUnit_Less_Than_Hundread() {
        return unit_Less_Than_Hundread;
    }

    public void setUnit_Less_Than_Hundread(String unit_Less_Than_Hundread) {
        this.unit_Less_Than_Hundread = unit_Less_Than_Hundread;
    }

    public String getUnit_Between_Hundread_To_Two_Hundread() {
        return unit_Between_Hundread_To_Two_Hundread;
    }

    public void setUnit_Between_Hundread_To_Two_Hundread(String unit_Between_Hundread_To_Two_Hundread) {
        this.unit_Between_Hundread_To_Two_Hundread = unit_Between_Hundread_To_Two_Hundread;
    }

    public String getUnit_Between_Two_Hundread_to_Three_Hundread() {
        return unit_Between_Two_Hundread_to_Three_Hundread;
    }

    public void setUnit_Between_Two_Hundread_to_Three_Hundread(String unit_Between_Two_Hundread_to_Three_Hundread) {
        this.unit_Between_Two_Hundread_to_Three_Hundread = unit_Between_Two_Hundread_to_Three_Hundread;
    }

    public String getUnit_Greater_Than_Three_Hundread() {
        return unit_Greater_Than_Three_Hundread;
    }

    public void setUnit_Greater_Than_Three_Hundread(String unit_Greater_Than_Three_Hundread) {
        this.unit_Greater_Than_Three_Hundread = unit_Greater_Than_Three_Hundread;
    }
    
    
}
