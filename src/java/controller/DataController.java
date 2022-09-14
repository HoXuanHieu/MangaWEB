/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOUser;
import Entity.Book;
import Entity.SortByID;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ho Hieu
 */
public class DataController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        DAOUser user = new DAOUser();
        ArrayList<Book> books = user.getData();
        int numberItem = books.size();
        String pageString = request.getParameter("PageNumber");     
        int page;
        if (pageString == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pageString);
        }
        int end = 1, begin = 1, count = 12;

        if ((int) (numberItem / 12 + 1) == page) {
            end = numberItem;
            begin = numberItem - (numberItem - (page - 1) * 12);
            count = numberItem - (page - 1) * 12;
        } else {
            end = page * 12;
            begin = end - 11;
        }
        ArrayList<Book> bookofshow = user.getDataForShow(begin, end, count);
        session.setAttribute("maxItems", bookofshow.size());
        request.setAttribute("List", bookofshow);
        session.setAttribute("TotalPage", books.size() / 12 + 1);
        request.setAttribute("PageNumber", page);
        request.getRequestDispatcher("HomePage.jsp").forward(request, response);
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
