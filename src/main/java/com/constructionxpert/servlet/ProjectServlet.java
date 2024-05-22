package com.constructionxpert.servlet;

import com.constructionxpert.dao.ProjectDAO;
import com.constructionxpert.dao.impl.ProjectDAOImpl;
import com.constructionxpert.model.Project;
import com.constructionxpert.utils.DatabaseUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/project")
public class ProjectServlet extends HttpServlet {
    private ProjectDAO projectDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DatabaseUtils.getConnection();
        projectDAO = new ProjectDAOImpl(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProject(request, response);
                break;
            default:
                listProjects(request, response);
                break;
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("project-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Project existingProject = projectDAO.getProjectById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("project-form.jsp");
        request.setAttribute("project", existingProject);
        dispatcher.forward(request, response);
    }

    private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        projectDAO.deleteProject(id);
        response.sendRedirect("project");
    }

    private void listProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> listProjects = projectDAO.getAllProjects();
        request.setAttribute("listProjects", listProjects);
        RequestDispatcher dispatcher = request.getRequestDispatcher("project-list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");
        String budgetStr = request.getParameter("budget");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        try {
            startDate = sdf.parse(startDateStr);
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        double budget = Double.parseDouble(budgetStr);

        Project project = new Project();
        project.setName(name);
        project.setDescription(description);
        project.setStartDate(startDate);
        project.setEndDate(endDate);
        project.setBudget(budget);

        if (id == null || id.isEmpty()) {
            projectDAO.addProject(project);
        } else {
            project.setId(Integer.parseInt(id));
            projectDAO.updateProject(project);
        }
        response.sendRedirect("project");
    }
}
