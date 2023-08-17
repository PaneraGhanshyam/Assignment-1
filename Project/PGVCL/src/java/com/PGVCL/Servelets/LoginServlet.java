
package com.PGVCL.Servelets;

import com.PGVCL.Dao.UserDao;
import com.PGVCL.Entities.ErrorMessage;
import com.PGVCL.Entities.Rates;
import com.PGVCL.Entities.User;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //login
            String Number=request.getParameter("number");
            String Password=request.getParameter("password");
            String Type=request.getParameter("role");
            
           UserDao dao=new UserDao(ConnectionProvider.getConnection());
            
           User user=dao.getUserByNumberAndPassword(Number, Password, Type);
           
           
           if(user==null)
           {   
               //error            
               ErrorMessage msg=new ErrorMessage("Invalid Details ! try with another","userNotFound","alert-danger");
               HttpSession s=request.getSession();
               s.setAttribute("Message", msg);
               
               response.sendRedirect("login.jsp");
           }
           else if(user.getStatus().equals("deactive"))
           {    
                //checkstatus
                 ErrorMessage msg=new ErrorMessage("Account Deactive ! try later","userDeactive","alert-danger");
                 HttpSession s=request.getSession();
                 s.setAttribute("Message", msg);
                 
                 response.sendRedirect("login.jsp");
           }
           else if(user.getStatus().equals("active"))
           {
               //success
               HttpSession s=request.getSession();
               s.setAttribute("currentUser", user);
               response.sendRedirect("index.jsp");
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
