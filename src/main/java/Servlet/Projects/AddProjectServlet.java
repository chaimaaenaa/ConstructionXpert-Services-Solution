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

@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Projects/addProject.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        Project project = new Project();
        project.setpName(name);
        project.setpDescription(description);
        project.setpStartdate(startDate);
        project.setpEndDate(endDate);
        project.setBudget(budget);

        try {
            projectDao.addProject(project);
            response.sendRedirect(request.getContextPath() + "/Projects/listProjects");
        } catch (SQLException e) {
            throw new ServletException("Error adding project", e);
        }
    }
}
