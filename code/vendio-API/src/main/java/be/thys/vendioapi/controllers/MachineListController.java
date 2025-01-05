package be.thys.vendioapi.controllers;

import be.thys.vendioapi.model.MachinePOI;
import be.thys.vendioapi.model.Position;
import be.thys.vendioapi.repository.MachineRepository;
import org.bson.types.ObjectId;
import org.springframework.web.bind.annotation.*;

import javax.crypto.Mac;
import java.util.List;

@RestController
public class MachineListController {
    private final MachineRepository repository;

    MachineListController(MachineRepository repository){
        this.repository = repository;
    }

    @GetMapping("/machines")
    List<MachinePOI> allByPosition(
            @RequestParam(name="long", required = false) String longitude,
            @RequestParam(name="lat", required = false) String latitude,
            @RequestParam(name="name",required = false) String name
    ){
        if(longitude!= null && latitude != null){
            double doubleLongitude = Double.parseDouble(longitude);
            double doubleLatitude = Double.parseDouble(latitude);
            Position position = new Position(doubleLongitude,doubleLatitude);
            return repository.findMachinePOISByPosition(position);
        }
        if(name != null){
            return repository.findMachinesByName(name);
        }
        return repository.findAll();
    }

    @GetMapping("/machines/{id}")
    MachinePOI getByID(@PathVariable String id){
        return repository.findMachineById(id);
    }

    @PostMapping("/machines")
    MachinePOI newMachine(@RequestBody MachinePOI newMachine){
        return repository.save(newMachine);
    }

    @PutMapping("/machines/{id}")
    MachinePOI updateMachine(@RequestBody MachinePOI newMachine, @PathVariable String id){
        MachinePOI machine =  repository.findMachineById(id);
        machine.setId(newMachine.getId());
        machine.setMachineId(newMachine.getMachineId());
        machine.setMachineName(newMachine.getMachineName());
        machine.setPosition(newMachine.getPosition());
        machine.setProductsList(newMachine.getProductsList());
        return repository.save(machine);
    }
}