package com.constructionxpert.dao.impl;

import com.constructionxpert.dao.ResourceDAO;
import com.constructionxpert.model.Resource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAOImpl implements ResourceDAO {
    private Connection connection;

    public ResourceDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void addResource(Resource resource) {
        String sql = "INSERT INTO resources (name, type, quantity, supplier_info, project_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.setInt(5, resource.getProjectId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateResource(Resource resource) {
        String sql = "UPDATE resources SET name = ?, type = ?, quantity = ?, supplier_info = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.setInt(5, resource.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteResource(int id) {
        String sql = "DELETE FROM resources WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Resource getResourceById(int id) {
        String sql = "SELECT * FROM resources WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resource.setProjectId(rs.getInt("project_id"));
                return resource;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Resource> getAllResourcesByProjectId(int projectId) {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources WHERE project_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, projectId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resource.setProjectId(rs.getInt("project_id"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resources;
    }
}
