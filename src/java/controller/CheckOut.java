/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOUser;
import Entity.Book;
import Entity.Cart;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class CheckOut extends HttpServlet {

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
            out.println("<title>Servlet CheckOut</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String bookToCheckOut[] = request.getParameterValues("bookCheckOut");
        ArrayList<Book> bookForshow = new ArrayList<>();
        ArrayList<Cart> cartForShow = new ArrayList<>();
        String address = request.getParameter("address");
        String Error = "";
        if (bookToCheckOut != null) {
            int userId = (Integer) session.getAttribute("userId");
            ArrayList<User> users = DAOUser.getUser();
            for (User user : users) {
                if (user.getUserId() == userId) {
                    request.setAttribute("NameUser", user.getFirstName() + " " + user.getLastName());
                }
            }
            Date datecheckout = new Date(System.currentTimeMillis());
            request.setAttribute("date", datecheckout);
            ArrayList<Cart> carts = DAOUser.getCart(userId, 0);
            ArrayList<Book> books = DAOUser.getData();
            float bill = 0;
            for (String cartId : bookToCheckOut) {
                for (Cart cart : carts) {
                    if (cart.getCartid() == (Integer.parseInt(cartId))) {
                        for (Book book : books) {
                            if ((book.getBookId().equals(cart.getBookid()))) {
                                if (book.getNumberOfBook() >= cart.getNum()) {
                                    bookForshow.add(book);
                                    cartForShow.add(cart);
                                    bill += book.getPrice() * cart.getNum();
                                    DAOUser.setCartToCheckOut(datecheckout, cart.getCartid(), address);
                                    DAOUser.setNumberOfBook(book.getBookId(), book.getNumberOfBook() - cart.getNum());
                                } else {
                                    Error = "Số lượng của sản phẩm  " + book.getTitle() + " trong kho không đủ.";
                                    request.setAttribute("error", Error);
                                }
                            }
                        }
                    }
                }
            }
            request.setAttribute("address", address);
            request.setAttribute("bill", bill);
            request.setAttribute("CartCheckOut", cartForShow);
            request.setAttribute("BookCheckOut", bookForshow);
            if (Error.isEmpty()) {
                request.getRequestDispatcher("invoice.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("CartController?userId=" + userId).forward(request, response);

            }

        } else {
            request.setAttribute("noCheckOut", "Không có sản phẩm nào để check Out.");
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
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
