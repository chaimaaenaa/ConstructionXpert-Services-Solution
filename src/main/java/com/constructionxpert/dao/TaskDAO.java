package com.constructionxpert.dao;

import com.constructionxpert.model.Task;
import java.util.List;

public interface TaskDAO {
    void addTask(Task task);
    void updateTask(Task task);
    void deleteTask(int id);
    Task getTaskById(int id);
    List<Task> getAllTasksByProjectId(int projectId);
}
