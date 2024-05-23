package Servlet.Projects;
import DaoImp.ProjectDaoImp;
import Model.Project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Projects/listProjects")
public class ListProjectsServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Project> listProjects = projectDao.selectAllProjects();
            request.setAttribute("listProjects", listProjects);
            request.getRequestDispatcher("/WEB-INF/Projects/listProjects.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving projects", e);
        }
    }
}
