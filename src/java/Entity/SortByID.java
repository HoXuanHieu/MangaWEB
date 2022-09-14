/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Comparator;

/**
 *
 * @author Ho Hieu
 */
public class SortByID implements Comparator<Book>{

    @Override
    public int compare(Book o1, Book o2) {
       return o1.getBookId().compareTo(o2.getBookId());
    }
    
}
