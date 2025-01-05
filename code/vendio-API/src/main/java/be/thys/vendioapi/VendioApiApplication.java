package be.thys.vendioapi;

import be.thys.vendioapi.model.MachinePOI;
import be.thys.vendioapi.model.Position;
import be.thys.vendioapi.model.Products;
import be.thys.vendioapi.repository.AuthUserRepository;
import be.thys.vendioapi.repository.MachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@SpringBootApplication
public class VendioApiApplication {

    @Autowired
    private MachineRepository machineRepository;

    @Autowired
    private AuthUserRepository userRepository;

    public static void main(String[] args) {
        SpringApplication.run(VendioApiApplication.class, args);
    }
}

