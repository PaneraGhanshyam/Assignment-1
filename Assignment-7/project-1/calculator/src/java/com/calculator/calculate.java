
package com.calculator;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

/** 
 *
 * @author ghanshyam
 */

public class calculate extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
        res.setContentType("text/html");
        PrintWriter out=res.getWriter();
        
        out.print("<h1>CALCULATOR</h1>");
        int n1 =Integer.parseInt(req.getParameter("num1"));
        out.print("<h1>"+n1); 
        
        String op=req.getParameter("operation");
        out.print(op);
         
        int n2=Integer.parseInt(req.getParameter("num2"));
        out.print(n2+" :");
        
        if(n2==0 && op.equals("/"))
        {
            out.print("can not divide by zero");
        }
        else
        {
            if(!"+".equals(op))
            if("-".equals(op))
                out.print(" "+(n1-n2)+"</h1");
            else if("*".equals(op))
                out.print(" "+(n1*n2)+"</h1");
            else if("/".equals(op))
                out.print(" "+(n1/n2)+"</h1");
            else out.print(" "+(n1+n2)+"</h1");
        }
        
    }
    
}
