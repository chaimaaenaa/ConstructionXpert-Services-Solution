package com.constructionxpert.servlet;

import com.constructionxpert.dao.TaskDAO;
import com.constructionxpert.dao.impl.TaskDAOImpl;
import com.constructionxpert.model.Task;
import com.constructionxpert.utils.DatabaseUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private TaskDAO taskDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DatabaseUtils.getConnection();
        taskDAO = new TaskDAOImpl(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        List<Task> tasks = taskDAO.getAllTasksByProjectId(projectId);
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/task-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            Task task = new Task();
            task.setDescription(request.getParameter("description"));
            task.setStartDate(java.sql.Date.valueOf(request.getParameter("startDate")));
            task.setEndDate(java.sql.Date.valueOf(request.getParameter("endDate")));
            task.setStatus(request.getParameter("status"));
            task.setProjectId(Integer.parseInt(request.getParameter("projectId")));
            taskDAO.addTask(task);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Task task = taskDAO.getTaskById(id);
            if (task != null) {
                task.setDescription(request.getParameter("description"));
                task.setStartDate(java.sql.Date.valueOf(request.getParameter("startDate")));
                task.setEndDate(java.sql.Date.valueOf(request.getParameter("endDate")));
                task.setStatus(request.getParameter("status"));
                task.setProjectId(Integer.parseInt(request.getParameter("projectId")));
                taskDAO.updateTask(task);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            taskDAO.deleteTask(id);
        }
        response.sendRedirect("tasks?projectId=" + request.getParameter("projectId"));
    }
}
