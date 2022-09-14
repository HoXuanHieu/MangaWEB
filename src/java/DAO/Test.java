/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Book;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author Ho Hieu
 */
public class Test {
    public static Scanner sc= new Scanner(System.in);
    public static void main(String[] args) {
        ArrayList<Book> books = DAOUser.getDataByCategory(1, 43, 43, "Hành động");
        
        for (Book book : books) {
            System.out.println(book.getBookId()+ " "+ book.getTitle()+": "+book.getCategory());
        }
        
    }
    
}
