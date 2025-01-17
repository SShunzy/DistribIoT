package be.thys.vendioapi.model;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.MongoId;

import java.util.List;

@Document(collection = "machines")
public class MachinePOI {
    @MongoId
    private ObjectId id;
    private String machineId;

    private String machineName;
    private List<String> types;
    private Position position;

    private List<Products> productsList;
    private List<Reviews> reviewsList;

    public MachinePOI(String machineId, String machineName, Position position,List<String> types,
                      List<Products> productsList, List<Reviews> reviewsList){
        super();
        this.machineId = machineId;
        this.machineName = machineName;
        this.position = position;
        this.types = types;
        this.productsList = productsList;
        this.reviewsList = reviewsList;
    }
    public String getMachineId(){
        return this.machineId;
    }

    public void setMachineId(String machineId){
        this.machineId = machineId;
    }
    public String getMachineName(){
        return this.machineName;
    }

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public void setMachineName(String machineName) {
        this.machineName = machineName;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public List<Products> getProductsList() {
        return productsList;
    }

    public void setProductsList(List<Products> productsList) {
        this.productsList = productsList;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public List<Reviews> getReviewsList() {
        return reviewsList;
    }

    public void setReviewsList(List<Reviews> reviewsList) {
        this.reviewsList = reviewsList;
    }
}
