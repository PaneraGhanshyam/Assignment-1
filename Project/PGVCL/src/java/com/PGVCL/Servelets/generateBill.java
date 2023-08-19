package com.PGVCL.Servelets;

import com.PGVCL.Dao.UserDao;
import com.PGVCL.Entities.ErrorMessage;
import com.PGVCL.Entities.Rates;
import com.PGVCL.Helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ghanshyam
 */
public class generateBill extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet generateBill</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String u_id=request.getParameter("u_id");
            String username=request.getParameter("username");
            String number=request.getParameter("number");
            String address=request.getParameter("address");
            int unit=Integer.parseInt(request.getParameter("unit"));
            int dues=Integer.parseInt(request.getParameter("dues"));
            String year=request.getParameter("year");
            String month=request.getParameter("month");
            int amount=0;
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            
            Rates rates=dao.getRates();
            
            if (unit <= 100) {
                amount = unit * Integer.parseInt(rates.getUnit_Less_Than_Hundread());
            } else if (unit > 100 && unit <= 200) {
                amount = 100 * Integer.parseInt(rates.getUnit_Less_Than_Hundread());
                amount += (unit - 100) * Integer.parseInt(rates.getUnit_Between_Hundread_To_Two_Hundread());
            } else if (unit > 200 && unit <= 300) {
                amount = 100 * Integer.parseInt(rates.getUnit_Less_Than_Hundread());
                amount += 100 * Integer.parseInt(rates.getUnit_Between_Hundread_To_Two_Hundread());
                amount += (unit - 200) * Integer.parseInt(rates.getUnit_Between_Two_Hundread_to_Three_Hundread());
            } else if (unit > 300) {
                amount = 100 * Integer.parseInt(rates.getUnit_Less_Than_Hundread());
                amount += 100 * Integer.parseInt(rates.getUnit_Between_Hundread_To_Two_Hundread());
                amount += 100 * Integer.parseInt(rates.getUnit_Between_Two_Hundread_to_Three_Hundread());
                amount += (unit - 300) * Integer.parseInt(rates.getUnit_Greater_Than_Three_Hundread());
            }

            amount += dues;
            
            if(dao.insertBill(u_id,username,number,address,year,month,amount))
            {
                ErrorMessage msg=new ErrorMessage("Bill generated succesfully !","generateSuccess","alert-success");
                HttpSession s=request.getSession();
                s.setAttribute("Message", msg);

                response.sendRedirect("generate_bill.jsp");
            }
            else
            {
                ErrorMessage msg=new ErrorMessage("Bill generation unsuccessfull !","generationUnsuccess","alert-danger");
                HttpSession s=request.getSession();
                s.setAttribute("Message", msg);

                response.sendRedirect("generate_bill.jsp");
            }
            
           
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
