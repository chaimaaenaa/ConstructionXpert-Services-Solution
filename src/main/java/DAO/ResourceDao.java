package DAO;
import Model.Resource;
import java.sql.SQLException;
import java.util.List;

public interface ResourceDao {
    void addResource(Resource resource) throws SQLException;
    boolean updateResource(Resource resource) throws SQLException;
    void deleteResource(int rId) throws SQLException;
    List<Resource> selectAllResources(int tId) throws SQLException;
    Resource selectResourceById(int rId) throws SQLException;
}
