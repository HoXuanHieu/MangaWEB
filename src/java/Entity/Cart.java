/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Ho Hieu
 */
public class Cart {

    private int Cartid;
    private String bookid;
    private int UserId;
    private Date DateBuy;
    private boolean CheckOut;
    private int num;
    private String adress;
    public Cart() {
    }

    public Cart(int Cartid, String bookid, int UserId, Date DateBuy, boolean CheckOut, int num, String adress) {
        this.Cartid = Cartid;
        this.bookid = bookid;
        this.UserId = UserId;
        this.DateBuy = DateBuy;
        this.CheckOut = CheckOut;
        this.num = num;
        this.adress = adress;
    }

    

    public int getCartid() {
        return Cartid;
    }

    public void setCartid(int Cartid) {
        this.Cartid = Cartid;
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public Date getDateBuy() {
        return DateBuy;
    }

    public void setDateBuy(Date DateBuy) {
        this.DateBuy = DateBuy;
    }

    public boolean isCheckOut() {
        return CheckOut;
    }

    public void setCheckOut(boolean CheckOut) {
        this.CheckOut = CheckOut;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }
    
    
}
