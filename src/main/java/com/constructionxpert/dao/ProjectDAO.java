package com.constructionxpert.dao;

import com.constructionxpert.model.Project;
import java.util.List;

public interface ProjectDAO {
    void addProject(Project project);
    void updateProject(Project project);
    void deleteProject(int id);
    Project getProjectById(int id);
    List<Project> getAllProjects();
}
