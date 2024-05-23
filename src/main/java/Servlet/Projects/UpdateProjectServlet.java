package Servlet.Projects;

import DaoImp.ProjectDaoImp;
import Model.Project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/UpdateProjectServlet")
public class UpdateProjectServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("projectId"));

        try {
            Project existingProject = projectDao.selectProjectById(id);
            request.setAttribute("project", existingProject);
            request.getRequestDispatcher("/WEB-INF/Projects/UpdateProject.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving project", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        Project project = new Project(id, name, description, startDate, endDate, budget);

        try {
            projectDao.updateProject(project);
            response.sendRedirect(request.getContextPath() + "/Projects/listProjects");
        } catch (SQLException e) {
            throw new ServletException("Error updating project", e);
        }
    }
}
