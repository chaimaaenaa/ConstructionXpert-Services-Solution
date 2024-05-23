package Servlet.Resources;

import DaoImp.ResourceDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteResourceServlet")
public class DeleteResourceServlet extends HttpServlet {
    private ResourceDaoImp resourceDao;

    @Override
    public void init() {
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));

        try {
            resourceDao.deleteResource(resourceId);
        } catch (SQLException e) {
            throw new ServletException("Error deleting resource", e);
        }

        response.sendRedirect(request.getContextPath() + "/ListResourcesServlet?taskId=" + taskId);
    }
}
