package be.thys.vendioapi.model;

import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.MongoId;
import org.springframework.data.mongodb.core.mapping.MongoId;

@Document(collection = "users")
public class AuthUser{
    @MongoId
    public String id;
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
}