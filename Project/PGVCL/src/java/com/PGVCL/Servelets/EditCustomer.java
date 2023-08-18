/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.PGVCL.Servelets;

import com.PGVCL.Dao.UserDao;
import com.PGVCL.Entities.ErrorMessage;
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
public class EditCustomer extends HttpServlet {

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
            out.println("<title>Servlet EditCustomer</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int id=Integer.parseInt(request.getParameter("id"));
            String username=request.getParameter("username");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String number=request.getParameter("number");
            String password=request.getParameter("confirmpassword");
            String status=request.getParameter("status");
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            
            if(dao.editUser(id,username,email,address,number,password,status))
            {
                ErrorMessage msg=new ErrorMessage("Successfully edited !","userEditesuccess","alert-success");
                HttpSession s=request.getSession();
                s.setAttribute("Message", msg);
               
                response.sendRedirect("customer.jsp");
            }
            else
            {
                ErrorMessage msg=new ErrorMessage("Edite unsuccessfull !","userEditeunsuccess","alert-danger");
                HttpSession s=request.getSession();
                s.setAttribute("Message", msg);
               
                response.sendRedirect("customer.jsp");
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
