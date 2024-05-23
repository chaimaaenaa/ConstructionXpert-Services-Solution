package DaoImp;
import DAO.ProjectDao;
import Db_Connector.Db_Connection;
import Model.Project;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ProjectDaoImp implements ProjectDao {

    private static final String INSERT_PROJECT_SQL = "INSERT INTO project (p_id, p_name, p_description, p_start_date, p_end_date, budget) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_PROJECT_SQL = "UPDATE project SET p_name = ?, p_description = ?, p_start_date = ?, p_end_date = ?, budget = ? WHERE p_id = ?;";
    private static final String DELETE_PROJECT_SQL = "DELETE FROM project WHERE p_id = ?;";
    private static final String SELECT_ALL_PROJECT_SQL = "SELECT * FROM project;";
    private static final String SELECT_PROJECT_BY_ID_SQL = "SELECT * FROM project WHERE p_id = ?;";

    @Override
    public void addProject(Project project) throws SQLException {
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_PROJECT_SQL)) {
            statement.setInt(1, project.getpId());
            statement.setString(2, project.getpName());
            statement.setString(3, project.getpDescription());
            statement.setDate(4, project.getpStartdate());
            statement.setDate(5, project.getpEndDate());
            statement.setDouble(6, project.getBudget());
            statement.executeUpdate();
        }
    }

    @Override
    public boolean updateProject(Project project) throws SQLException {
        boolean isUpdated;
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PROJECT_SQL)) {
            statement.setString(1, project.getpName());
            statement.setString(2, project.getpDescription());
            statement.setDate(3, project.getpStartdate());
            statement.setDate(4, project.getpEndDate());
            statement.setDouble(5, project.getBudget());
            statement.setInt(6, project.getpId());
            isUpdated = statement.executeUpdate() > 0;
        }
        return isUpdated;
    }

    public void deleteProject(int pId) throws SQLException {
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_SQL)) {
            statement.setInt(1, pId);
            statement.executeUpdate();
        }
    }


    @Override
    public List<Project> selectAllProjects() throws SQLException {
        List<Project> allProjects = new ArrayList<>();
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PROJECT_SQL);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                int pId = rs.getInt("p_id");
                String pName = rs.getString("p_name");
                String pDescription = rs.getString("p_description");
                Date pStartdate = rs.getDate("p_start_date");
                Date pEndDate = rs.getDate("p_end_date");
                double budget = rs.getDouble("budget");
                allProjects.add(new Project(pId, pName, pDescription, pStartdate, pEndDate, budget));
            }
        }
        return allProjects;
    }

    @Override
    public Project selectProjectById(int pId) throws SQLException {
        Project project = null;
        try (Connection connection = Db_Connection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_PROJECT_BY_ID_SQL)) {
            statement.setInt(1, pId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    String pName = rs.getString("p_name");
                    String pDescription = rs.getString("p_description");
                    Date pStartdate = rs.getDate("p_start_date");
                    Date pEndDate = rs.getDate("p_end_date");
                    double budget = rs.getDouble("budget");
                    project = new Project(pId, pName, pDescription, pStartdate, pEndDate, budget);
                }
            }
        }
        return project;
    }
}
