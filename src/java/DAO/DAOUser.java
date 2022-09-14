/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConnectDB.DBConnection;
import Entity.Book;
import Entity.Cart;
import Entity.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ho Hieu
 */
public class DAOUser {

    public DAOUser() {
    }

    public static ArrayList<Book> getData() {
        ArrayList<Book> books = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [Assignment_BookStore].[dbo].[BookData];";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                String bookID = result.getString(1);
                String title = result.getString(2);
                String authorID = result.getString(3);
                String genre = result.getString(4);
                String categoryStr = result.getString(5);
                String description = result.getString(6);
                float price = result.getFloat(7);
                int numberOfBook = result.getInt(8);
                String imgUrl = result.getString(9);

                StringTokenizer token = new StringTokenizer(categoryStr, ",");
                int n = token.countTokens();
                String[] category = new String[n];
                int count = 0;
                while (token.hasMoreTokens()) {
                    category[count] = token.nextToken();
                    count++;
                }
                books.add(new Book(bookID, title, authorID, genre, category, description, price, numberOfBook, imgUrl));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return books;
    }

    public static ArrayList<Book> getDataForShow(int begin, int end, int countBook) {
        ArrayList<Book> books = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT TOP " + countBook + " * FROM ( SELECT ROW_NUMBER() OVER(ORDER BY BookId) AS IndexNo, *\n"
                + "FROM (SELECT DISTINCT * FROM [Assignment_BookStore].[dbo].[BookData]) AS TEMPA) as TEMPB WHERE IndexNo  between " + begin + " and " + end;
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                String bookID = result.getString(2);
                String title = result.getString(3);
                String authorID = result.getString(4);
                String genre = result.getString(5);
                String categoryStr = result.getString(6);
                String description = result.getString(7);
                float price = result.getFloat(8);
                int numberOfBook = result.getInt(9);
                String imgUrl = result.getString(10);

                StringTokenizer token = new StringTokenizer(categoryStr, ",");
                int n = token.countTokens();
                String[] category = new String[n];
                int count = 0;
                while (token.hasMoreTokens()) {
                    category[count] = token.nextToken();
                    count++;
                }
                books.add(new Book(bookID, title, authorID, genre, category, description, price, numberOfBook, imgUrl));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return books;
    }

    public static ArrayList<Book> getDataByGenre(int begin, int end, int countBook, String genreInput) {
        ArrayList<Book> books = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT TOP " + countBook + " * FROM ( SELECT ROW_NUMBER() OVER(ORDER BY BookId) AS IndexNo, *\n"
                + "FROM (SELECT DISTINCT * FROM [Assignment_BookStore].[dbo].[BookData] where Genre = N'" + genreInput + "') AS TEMPA) as TEMPB WHERE IndexNo  between " + begin + " and " + end;
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                String bookID = result.getString(2);
                String title = result.getString(3);
                String authorID = result.getString(4);
                String genre = result.getString(5);
                String categoryStr = result.getString(6);
                String description = result.getString(7);
                float price = result.getFloat(8);
                int numberOfBook = result.getInt(9);
                String imgUrl = result.getString(10);

                StringTokenizer token = new StringTokenizer(categoryStr, ",");
                int n = token.countTokens();
                String[] category = new String[n];
                int count = 0;
                while (token.hasMoreTokens()) {
                    category[count] = token.nextToken();
                    count++;
                }
                books.add(new Book(bookID, title, authorID, genre, category, description, price, numberOfBook, imgUrl));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return books;
    }

    public static ArrayList<Book> getDataByCategory(int begin, int end, int countBook, String categoryInput) {
        ArrayList<Book> books = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT TOP " + countBook + "* FROM( SELECT ROW_NUMBER() OVER(ORDER BY BookId) AS IndexNo, *\n"
                + "  FROM (\n"
                + "           SELECT DISTINCT * FROM [Assignment_BookStore].[dbo].[BookData] where Category like N'%" + categoryInput + "%'\n"
                + ") AS TEMPA\n"
                + "  ) as TEMPB WHERE IndexNo between " + begin + " and " + end;
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                String bookID = result.getString(2);
                String title = result.getString(3);
                String authorID = result.getString(4);
                String genre = result.getString(5);
                String categoryStr = result.getString(6);
                String description = result.getString(7);
                float price = result.getFloat(8);
                int numberOfBook = result.getInt(9);
                String imgUrl = result.getString(10);
                StringTokenizer token = new StringTokenizer(categoryStr, ",");
                int n = token.countTokens();
                String[] category = new String[n];
                int count = 0;
                while (token.hasMoreTokens()) {
                    category[count] = token.nextToken();
                    count++;
                }
                books.add(new Book(bookID, title, authorID, genre, category, description, price, numberOfBook, imgUrl));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return books;
    }

    public static ArrayList<User> getUser() {
        ArrayList<User> user = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM Users;";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int userid = result.getInt(1);
                String userName = result.getString(2);
                String passwork = result.getString(3);
                String email = result.getString(4);
                String firstName = result.getString(5);
                String lastName = result.getString(6);
                String typeUser = result.getString(8);
                String phone = result.getString(7);
                user.add(new User(userid, userName, passwork, email, firstName, lastName, typeUser, phone));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    public static boolean register(User user) {
        DBConnection db = DBConnection.getInstance();
        String sql = "INSERT INTO Users VALUES (?,?,?,?,?,?,?);";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPasswork());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getFirstName());
            statement.setString(5, user.getLastName());
            statement.setString(6, user.getPhone());
            statement.setString(7, user.getTypeUser());
            statement.execute();
            statement.close();
            connect.close();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static boolean addCart(String bookId, int userid, Date date, int num) {
        DBConnection db = DBConnection.getInstance();
        String sql = "INSERT INTO Cart VALUES (?,?,?,?,?,?);";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, bookId);
            statement.setInt(2, userid);
            statement.setDate(3, date);
            statement.setBoolean(4, false);
            statement.setInt(5, num);
            statement.setString(6, null);
            statement.execute();
            statement.close();
            connect.close();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static ArrayList<Cart> getCart(int id, int checkOut) {
        ArrayList<Cart> carts = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "select * from Cart where UserId = '" + id + "' and CheckOut = '" + checkOut + "';";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int cartId = result.getInt(1);
                String bookId = result.getString(2);
                int userId = result.getInt(3);
                Date date = result.getDate(4);
                boolean checkout = result.getBoolean(5);
                int num = result.getInt(6);
                String address = result.getString(7);
                carts.add(new Cart(cartId, bookId, userId, date, checkout, num, address));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return carts;
    }

    public static boolean deleteCart(int cartId) {
        DBConnection db = DBConnection.getInstance();
        String sql = "Delete from Cart where Cartid = '" + cartId + "'";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.execute();
            statement.close();
            connect.close();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static void setCartToCheckOut(Date dateCheckOut, int cartId, String address) {
        DBConnection db = DBConnection.getInstance();
        String sql = " Update Cart set DateBuy = '" + dateCheckOut + "', CheckOut = '1',addressUser ='" + address + "' where Cartid ='" + cartId + "'";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.execute();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static boolean deleteBook(String id) {
        DBConnection db = DBConnection.getInstance();
        String sql = "delete from BookData where bookId ='" + id + "'";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.execute();
            statement.close();
            connect.close();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static void setNumberOfBook(String BookId, int num) {
        DBConnection db = DBConnection.getInstance();
        String sql = "Update BookData set Number_Of_Book = '" + num + "' where bookId ='" + BookId + "'";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.execute();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static boolean updateBook(Book book, String category) {
        DBConnection db = DBConnection.getInstance();
        String sql = "Update BookData set BookTitle=?, AuthorName =?,Genre=?,Category=?,BookDescription=?,Price=?,Number_Of_Book=?,img_url=? where bookId ='" + book.getBookId() + "'";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthorID());
            statement.setString(3, book.getGenre());
            statement.setString(4, category);
            statement.setString(5, book.getDescription());
            statement.setFloat(6, book.getPrice());
            statement.setInt(7, book.getNumberOfBook());
            statement.setString(8, book.getImgUrl());
            statement.execute();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static void addBook(String bookId, String titile, String authorName, String gerne, float price, int num, String category, String img_url, String description) {
        DBConnection db = DBConnection.getInstance();
        String sql = "Insert into BookData values(?,?,?,?,?,?,?,?,?)";
        try {
            Connection connect = db.getConnection();
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, bookId);
            statement.setString(2, titile);
            statement.setString(3, authorName);
            statement.setString(4, gerne);
            statement.setString(5, category);
            statement.setString(6, description);
            statement.setFloat(7, price);
            statement.setInt(8, num);
            statement.setString(9, img_url);
            statement.execute();
            statement.close();
            connect.close();
        } catch (Exception e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static ArrayList<Cart> getCheckedOutCarts() {
        ArrayList<Cart> cart = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "select * from Cart where CheckOut = '1'";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int cartId = result.getInt(1);
                String BookId = result.getString(2);
                int userId = result.getInt(3);
                Date dateBuy = result.getDate(4);
                boolean checkout = result.getBoolean(5);
                int num = result.getInt(6);
                String address = result.getString(7);
                cart.add(new Cart(cartId, BookId, userId, dateBuy, checkout, num, address));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return cart;
    }
    public static ArrayList<Cart> getCheckedOutCartsByDate() {
        ArrayList<Cart> cart = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "select * from Cart where CheckOut = '1' order by DateBuy DESC";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int cartId = result.getInt(1);
                String BookId = result.getString(2);
                int userId = result.getInt(3);
                Date dateBuy = result.getDate(4);
                boolean checkout = result.getBoolean(5);
                int num = result.getInt(6);
                String address = result.getString(7);
                cart.add(new Cart(cartId, BookId, userId, dateBuy, checkout, num, address));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return cart;
    }
    public static ArrayList<Cart> getCheckedOutCartsByNum() {
        ArrayList<Cart> cart = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "select * from Cart where CheckOut = '1' order by num DESC";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int cartId = result.getInt(1);
                String BookId = result.getString(2);
                int userId = result.getInt(3);
                Date dateBuy = result.getDate(4);
                boolean checkout = result.getBoolean(5);
                int num = result.getInt(6);
                String address = result.getString(7);
                cart.add(new Cart(cartId, BookId, userId, dateBuy, checkout, num, address));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return cart;
    }
    public static ArrayList<Cart> getCheckedOutCartsUserId() {
        ArrayList<Cart> cart = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "select * from Cart where CheckOut = '1' order by UserId ASC";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int cartId = result.getInt(1);
                String BookId = result.getString(2);
                int userId = result.getInt(3);
                Date dateBuy = result.getDate(4);
                boolean checkout = result.getBoolean(5);
                int num = result.getInt(6);
                String address = result.getString(7);
                cart.add(new Cart(cartId, BookId, userId, dateBuy, checkout, num, address));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return cart;
    }public static ArrayList<Cart> getCheckedOutCartsBookId() {
        ArrayList<Cart> cart = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = " select * from Cart where CheckOut = '1' order by bookid ASC";
        try {
            Connection connect = db.getConnection();
            Statement statement = connect.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int cartId = result.getInt(1);
                String BookId = result.getString(2);
                int userId = result.getInt(3);
                Date dateBuy = result.getDate(4);
                boolean checkout = result.getBoolean(5);
                int num = result.getInt(6);
                String address = result.getString(7);
                cart.add(new Cart(cartId, BookId, userId, dateBuy, checkout, num, address));
            }
            result.close();
            statement.close();
            connect.close();
        } catch (SQLException e) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
        }
        return cart;
    }
}
