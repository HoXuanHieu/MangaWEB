/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOUser;
import Entity.Book;
import Entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ho Hieu
 */
public class GetCheckedOutProducts extends HttpServlet {

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
            out.println("<title>Servlet GetCheckedOutProducts</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetCheckedOutProducts at " + request.getContextPath() + "</h1>");
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
        String sortby = request.getParameter("sortBy");
        ArrayList<Book> book = DAOUser.getData();
        ArrayList<Book> bookforShow = new ArrayList<>();
        if (sortby == null) {
            ArrayList<Cart> cart = DAOUser.getCheckedOutCarts();
            for (Cart cart1 : cart) {
                for (Book book1 : book) {
                    if (cart1.getBookid().equals(book1.getBookId())) {
                        bookforShow.add(book1);
                    }
                }
            }
            request.setAttribute("ListBook", bookforShow);
            request.setAttribute("ListCart", cart);
            request.getRequestDispatcher("ProductsCheckedOut.jsp").forward(request, response);
        } else if (sortby.equals("num")) {
            ArrayList<Cart> cart = DAOUser.getCheckedOutCartsByNum();
            for (Cart cart1 : cart) {
                for (Book book1 : book) {
                    if (cart1.getBookid().equals(book1.getBookId())) {
                        bookforShow.add(book1);
                    }
                }
            }
            request.setAttribute("ListBook", bookforShow);
            request.setAttribute("ListCart", cart);
            request.getRequestDispatcher("ProductsCheckedOut.jsp").forward(request, response);
        } else if (sortby.equals("date")) {
            ArrayList<Cart> cart = DAOUser.getCheckedOutCartsByDate();
            for (Cart cart1 : cart) {
                for (Book book1 : book) {
                    if (cart1.getBookid().equals(book1.getBookId())) {
                        bookforShow.add(book1);
                    }
                }
            }
            request.setAttribute("ListBook", bookforShow);
            request.setAttribute("ListCart", cart);
            request.getRequestDispatcher("ProductsCheckedOut.jsp").forward(request, response);
        }else if (sortby.equals("bookId")) {
            ArrayList<Cart> cart = DAOUser.getCheckedOutCartsBookId();
            for (Cart cart1 : cart) {
                for (Book book1 : book) {
                    if (cart1.getBookid().equals(book1.getBookId())) {
                        bookforShow.add(book1);
                    }
                }
            }
            request.setAttribute("ListBook", bookforShow);
            request.setAttribute("ListCart", cart);
            request.getRequestDispatcher("ProductsCheckedOut.jsp").forward(request, response);
        }else if (sortby.equals("UserId")) {
            ArrayList<Cart> cart = DAOUser.getCheckedOutCartsUserId();
            for (Cart cart1 : cart) {
                for (Book book1 : book) {
                    if (cart1.getBookid().equals(book1.getBookId())) {
                        bookforShow.add(book1);
                    }
                }
            }
            request.setAttribute("ListBook", bookforShow);
            request.setAttribute("ListCart", cart);
            request.getRequestDispatcher("ProductsCheckedOut.jsp").forward(request, response);
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
