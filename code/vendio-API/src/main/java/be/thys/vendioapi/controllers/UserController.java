package be.thys.vendioapi.controllers;

import be.thys.vendioapi.model.AuthUser;
import be.thys.vendioapi.model.LoginResponse;
import be.thys.vendioapi.services.AuthenticationService;
import be.thys.vendioapi.services.JwtService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class UserController{
    private final JwtService jwtService;
    private final AuthenticationService authenticationService;

    public UserController(JwtService jwtService, AuthenticationService authenticationService){
        this.jwtService = jwtService;
        this.authenticationService = authenticationService;
    }

    @PostMapping("/register")
    public ResponseEntity registerUser(@RequestBody AuthUser user){
        AuthUser returnUser = authenticationService.signup(user);
        return ResponseEntity.ok(returnUser);
    }

    @PostMapping("/auth")
    public ResponseEntity authenticateUser(
            @RequestHeader(value = "Authorization", required = false)String authorizationHeader,
            @RequestBody AuthUser user) {
        if(authorizationHeader == null || !authorizationHeader.startsWith("Bearer "))
            return ResponseEntity.status(404).build();
        String token = authorizationHeader.substring(7);
        if(jwtService.isTokenValid(token,user.getUsername()))
            return ResponseEntity.ok("Token: "+token);
        else
            return ResponseEntity.status(401).build();

    }

    @PutMapping("update_picture")
    public ResponseEntity updatePictureUser(
            @RequestHeader(value = "Authorization", required = false)String authorizationHeader,
            @RequestBody AuthUser input){
        if(authorizationHeader == null || !authorizationHeader.startsWith("Bearer "))
            return ResponseEntity.status(404).build();
        String token = authorizationHeader.substring(7);
        if(jwtService.isTokenValid(token,input.getUsername())){
            AuthUser user = authenticationService.updatePicture(input.getUsername(), input.getPictureURI());
            return ResponseEntity.ok("Picture: "+user.getPictureURI());
        }
        else
            return ResponseEntity.status(401).build();
    }

    @PostMapping("/login")
    public ResponseEntity loginUser(@RequestBody AuthUser user){
        AuthUser authenticatedUser = authenticationService.authenticate(user);

        String jwtToken = jwtService.generateToken(authenticatedUser);

        LoginResponse loginResponse = new LoginResponse(jwtToken,jwtService.getExpirationTime());

        return ResponseEntity.ok(loginResponse);
    }

}