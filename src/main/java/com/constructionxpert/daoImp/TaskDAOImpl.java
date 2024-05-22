package com.constructionxpert.dao.impl;

import com.constructionxpert.dao.TaskDAO;
import com.constructionxpert.model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAOImpl implements TaskDAO {
    private Connection connection;

    public TaskDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void addTask(Task task) {
        String sql = "INSERT INTO tasks (description, start_date, end_date, status, project_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, task.getDescription());
            stmt.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(3, new java.sql.Date(task.getEndDate().getTime()));
            stmt.setString(4, task.getStatus());
            stmt.setInt(5, task.getProjectId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET description = ?, start_date = ?, end_date = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, task.getDescription());
            stmt.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(3, new java.sql.Date(task.getEndDate().getTime()));
            stmt.setString(4, task.getStatus());
            stmt.setInt(5, task.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteTask(int id) {
        String sql = "DELETE FROM tasks WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Task getTaskById(int id) {
        String sql = "SELECT * FROM tasks WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Task task = new Task();
                task.setId(rs.getInt("id"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                task.setStatus(rs.getString("status"));
                task.setProjectId(rs.getInt("project_id"));
                return task;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Task> getAllTasksByProjectId(int projectId) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE project_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, projectId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Task task = new Task();
                task.setId(rs.getInt("id"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                task.setStatus(rs.getString("status"));
                task.setProjectId(rs.getInt("project_id"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
