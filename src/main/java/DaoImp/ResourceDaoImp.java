package DaoImp;

import DAO.ResourceDao;
import Db_Connector.Db_Connection;
import Model.Resource;
import Model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDaoImp implements ResourceDao {

    private static final String INSERT_RESOURCE_SQL = "INSERT INTO resource (r_name, r_type, r_quantity, provider, t_id) VALUES (?, ?, ?, ?, ?);";
    private static final String UPDATE_RESOURCE_SQL = "UPDATE resource SET r_name = ?, r_type = ?, r_quantity = ?, provider = ? WHERE r_id = ?;";
    private static final String DELETE_RESOURCE_SQL = "DELETE FROM resource WHERE r_id = ?;";
    private static final String SELECT_ALL_RESOURCE_SQL = "SELECT * FROM resource WHERE t_id = ?;";
    private static final String SELECT_RESOURCE_BY_ID_SQL = "SELECT * FROM resource WHERE t_id = ?;";


    @Override
    public void addResource(Resource resource) throws SQLException {
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_RESOURCE_SQL)) {
            statement.setString(1, resource.getrName());
            statement.setString(2, resource.getrType());
            statement.setInt(3, resource.getQuantity());
            statement.setString(4, resource.getProvider());
            statement.setInt(5, resource.gettId());
            statement.executeUpdate();
        }
    }

    @Override
    public boolean updateResource(Resource resource) throws SQLException {
        boolean isUpdated;
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_RESOURCE_SQL)) {
            statement.setString(1, resource.getrName());
            statement.setString(2, resource.getrType());
            statement.setInt(3, resource.getQuantity());
            statement.setString(4, resource.getProvider());
            statement.setInt(5, resource.getrId());
            isUpdated = statement.executeUpdate() > 0;
        }
        return isUpdated;
    }

    @Override
    public void deleteResource(int rId) throws SQLException {
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_RESOURCE_SQL)) {
            statement.setInt(1, rId);
            statement.executeUpdate();
        }
    }

    @Override
    public List<Resource> selectAllResources(int taskId) throws SQLException {
        List<Resource> allResources = new ArrayList<>();
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_RESOURCE_SQL);
        ) {
            statement.setInt(1, taskId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int rId = rs.getInt("r_id");
                String rName = rs.getString("r_name");
                String rType = rs.getString("r_type");
                int quantity = rs.getInt("r_quantity");
                String provider = rs.getString("provider");
                int tId = rs.getInt("t_id");
                allResources.add(new Resource(rId, rName, rType, quantity, provider, tId));
            }
        }

        return allResources;
    }

    @Override
    public Resource selectResourceById(int rId) throws SQLException {
        Resource resource = null;
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM resource WHERE r_id = ?")) {
            statement.setInt(1, rId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    String rName = rs.getString("r_name");
                    String rType = rs.getString("r_type");
                    int quantity = rs.getInt("r_quantity");
                    String provider = rs.getString("provider");
                    int tId = rs.getInt("t_id");
                    resource = new Resource(rId, rName, rType, quantity, provider, tId);
                }
            }
        }
        return resource;
    }

}