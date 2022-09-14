/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Ho Hieu
 */
public class Book implements Comparable<Book> {

    private String bookId;
    private String title;
    private String authorID;
    private String genre;
    private String[] category;
    private String description;
    private float price;
    private int numberOfBook;
    private String imgUrl;

    public Book() {
    }

    public Book(String bookId, String title, String authorID, String genre, String[] category, String description, float price, int numberOfBook, String imgUrl) {
        this.bookId = bookId;
        this.title = title;
        this.authorID = authorID;
        this.genre = genre;
        this.category = category;
        this.description = description;
        this.price = price;
        this.numberOfBook = numberOfBook;
        this.imgUrl = imgUrl;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String[] getCategory() {
        return category;
    }

    public void setCategory(String[] category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNumberOfBook() {
        return numberOfBook;
    }

    public void setNumberOfBook(int numberOfBook) {
        this.numberOfBook = numberOfBook;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Override
    public int compareTo(Book o) {
        return 0;
    }

    public String getStringCategory() {
        String s = "";
        for (String string : category) {
            s += string + ",";
        }
        return s;
    }
}
