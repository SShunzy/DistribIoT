package be.thys.vendioapi.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;

@JsonSerialize
public class Reviews {
    private int reviewId;
    private String userName;
    private String userPictureUri;
    private Date postDate;
    private double rating;
    private String commentary;

    public Reviews(int reviewId, String userName, String userPictureUri, Date postDate, double rating, String commentary) {
        this.reviewId = reviewId;
        this.userName = userName;
        this.userPictureUri = userPictureUri;
        this.postDate = postDate;
        this.rating = rating;
        this.commentary = commentary;
    }

    public String getCommentary() {
        return commentary;
    }

    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getUserPictureUri() {
        return userPictureUri;
    }

    public void setUserPictureUri(String userPictureUri) {
        this.userPictureUri = userPictureUri;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }
}
