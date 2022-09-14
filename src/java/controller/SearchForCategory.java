/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOUser;
import Entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ho Hieu
 */
public class SearchForCategory extends HttpServlet {

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
        String category = request.getParameter("category");
        ArrayList<Book> books = DAOUser.getData();
        ArrayList<Book> bookByCategory = new ArrayList<>();
        for (int i = 0; i < books.size(); i++) {
            for (int j = 0; j < books.get(i).getCategory().length; j++) {
                if (books.get(i).getCategory()[j].equals(category)) {
                    bookByCategory.add(books.get(i));
                }
            }
        }
        int numberItem = bookByCategory.size();
        String pageString = request.getParameter("PageNumber");
        int page;
        if (pageString == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pageString);
        }

        int end = 1, begin = 1, count = 8;

        if ((int) (numberItem / 8 + 1) == page) {
            end = numberItem;
            begin = numberItem - (numberItem - (page - 1) * 8);
            count = numberItem - (page - 1) * 8;
        } else {
            end = page * 8;
            begin = end - 7;
        }

        ArrayList<Book> bookofshow = DAOUser.getDataByCategory(begin, end, count, category);
 session.setAttribute("maxItems", bookofshow.size());
        session.setAttribute("categoryBook", category);
        request.setAttribute("List", bookofshow);
        if (bookByCategory.size() % 8 == 0) {
            session.setAttribute("TotalPage", bookByCategory.size() / 8);
        } else {
            session.setAttribute("TotalPage", bookByCategory.size() / 8 + 1);
        }
        request.getRequestDispatcher("FindByCategory.jsp").forward(request, response);
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
