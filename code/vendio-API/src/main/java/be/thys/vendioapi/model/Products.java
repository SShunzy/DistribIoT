package be.thys.vendioapi.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize
public class Products {
    private int productId;
    private String productName;
    private String pictureURI;
    private int stock;
    private double price;

    public Products(int productId, String productName, String pictureURI, int stock, double price){
        this.productId = productId;
        this.productName = productName;
        this.pictureURI = pictureURI;
        this.stock = stock;
        this.price = price;
    }

    public int getProductId(){
        return productId;
    }

    public void setProductId(int productId){
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPictureURI() {
        return pictureURI;
    }

    public void setPictureURI(String pictureURI) {
        this.pictureURI = pictureURI;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
