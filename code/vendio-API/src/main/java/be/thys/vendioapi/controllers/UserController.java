package be.thys.vendioapi.controllers;

import be.thys.vendioapi.model.AuthUser;
import be.thys.vendioapi.repository.AuthUserRepository;
import org.apache.catalina.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController{
    private final AuthUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserController(AuthUserRepository userRepository, PasswordEncoder passwordEncoder){
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/register")
    public ResponseEntity registerUser(@RequestBody AuthUser user){
        try {
            if (userRepository.findByUsername(user.getUsername()).isPresent())
                return ResponseEntity.status(HttpStatus.CONFLICT).body("Username already taken");
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            AuthUser save = userRepository.save(user);
            return ResponseEntity.ok(HttpStatus.CREATED);
        } catch (Exception e){
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }
}