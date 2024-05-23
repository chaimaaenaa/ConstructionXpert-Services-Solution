package Servlet;

import DAO.ProjectDao;
import DaoImp.ProjectDaoImp;
import Model.Project;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class WelcomeServlet extends HttpServlet {

    private   ProjectDao projectDao;

    public WelcomeServlet() {
        super();
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            List<Project> listProjects = projectDao.selectAllProjects();
            request.setAttribute("listProjects", listProjects);
            request.getRequestDispatcher("/WEB-INF/home/home.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving projects", e);
        }
    }
}