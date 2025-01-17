package be.thys.vendioapi.services;

import be.thys.vendioapi.model.AuthUser;
import be.thys.vendioapi.repository.AuthUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthenticationService {
    private final AuthUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;

    @Autowired
    public AuthenticationService(AuthUserRepository userRepository, PasswordEncoder passwordEncoder, AuthenticationManager authenticationManager) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.authenticationManager = authenticationManager;
    }

    public AuthUser signup(AuthUser input){
        if(userRepository.findByUsername(input.getUsername()).isPresent()){
            throw new IllegalArgumentException("Username is already Taken: "+ input.getUsername());
        }

        input.setPassword(passwordEncoder.encode(input.getPassword()));
        return userRepository.save(input);
    }

    public AuthUser updatePicture(String username, String pictureUri){
        Optional<AuthUser> user = userRepository.findByUsername(username);
        if(user.isEmpty()) return null;
        user.get().setPictureURI(pictureUri);
        return userRepository.save(user.get());
    }

    public AuthUser getPicture(AuthUser user){
        Optional<AuthUser> DBUser = userRepository.findByUsername(user.getUsername());
        if(DBUser.isEmpty()) return null;
        user.setPictureURI(DBUser.get().getPictureURI());
        return user;
    }
    public AuthUser authenticate(AuthUser input){
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        input.getUsername(),
                        input.getPassword()
                )
        );
        return userRepository.findByUsername(input.getUsername())
                .orElseThrow();
    }

}
