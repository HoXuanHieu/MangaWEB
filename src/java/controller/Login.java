/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOUser;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ho Hieu
 */
public class Login extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        String name = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("User")) {
                    name = cookie.getValue();
                }
            }
        }
        if (!name.isEmpty()) {
            request.setAttribute("user", name);
            request.getRequestDispatcher("CountCart?PageNumber=1").forward(request, response);
            session.setAttribute("pageNumber", "1");
        } else {
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        }
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String userLogin = request.getParameter("userName");
        String passwordLogin = request.getParameter("password");
        ArrayList<User> users = DAOUser.getUser();
        String check = "";
        String fulName = "null";
        int userId = 0;
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUserName().equals(userLogin)) {
                if (users.get(i).getPasswork().equals(passwordLogin)) {
                    if (users.get(i).getTypeUser().equals("user")) {
                        check = "user";
                        fulName = users.get(i).getFirstName() + " " + users.get(i).getLastName();
                        userId = users.get(i).getUserId();
                        break;
                    } else {
                        check = "admin";
                        fulName = users.get(i).getFirstName() + " " + users.get(i).getLastName();
                        break;
                    }

                }
            } else {
                check = "none";
            }
        }
        if (check.equals("user")) {
            session.setAttribute("Name", fulName);
            Cookie cookie = new Cookie("User", userLogin);
            cookie.setMaxAge(60 * 10);
            response.addCookie(cookie);
            session.setAttribute("userId", userId);
//            DataController?PageNumber=1
            request.getRequestDispatcher("CountCart?PageNumber=1").forward(request, response);
        } else if (check.equals("none")) {
            request.setAttribute("MessageError", "Sai Mật khẩu hoặc tài khoản, vui lòng đăng nhập lại.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        } else if (check.equals("admin")) {
            request.setAttribute("PageNumber", 1);
            request.getRequestDispatcher("GetProductsForAdmin?PageNumber=1").forward(request, response);
        }
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
