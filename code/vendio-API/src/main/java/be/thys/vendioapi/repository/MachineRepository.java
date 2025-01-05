package be.thys.vendioapi.repository;

import be.thys.vendioapi.model.MachinePOI;
import be.thys.vendioapi.model.Position;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MachineRepository extends MongoRepository<MachinePOI, String> {

    List<MachinePOI> findMachinePOISByPosition(Position position);

    @Query("{stringId:'?0'}")
    MachinePOI findMachineById(String id);
    @Query("{machineName:'?0'}")
    List<MachinePOI> findMachinesByName(String machineName);

    public long count();
}
