package DAO;
import Model.Task;
import java.sql.SQLException;
import java.util.List;

public interface TaskDao {
    void addTask(Task task) throws SQLException;
    boolean updateTask(Task task) throws SQLException;
    void deleteTask(int tId) throws SQLException;
    List<Task> selectAllTasks(int projectId) throws SQLException;
    Task selectTaskById(int tId) throws SQLException;
}
