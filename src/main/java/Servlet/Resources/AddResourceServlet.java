package Servlet.Resources;

import DaoImp.ResourceDaoImp;
import Model.Project;
import Model.Resource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AddResourceServlet")
public class AddResourceServlet extends HttpServlet {
    private ResourceDaoImp resourceDao;

    @Override
    public void init() {
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        request.setAttribute("taskId", taskId);
        request.getRequestDispatcher("/WEB-INF/Resources/addResource.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rName = request.getParameter("rName");
        String rType = request.getParameter("rType");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String provider = request.getParameter("provider");
        int tId = Integer.parseInt(request.getParameter("tId"));

        Resource resource = new Resource();
        resource.setrName(rName);
        resource.setrType(rType);
        resource.setQuantity(quantity);
        resource.setProvider(provider);
        resource.settId(tId);

        try {
            resourceDao.addResource(resource);
            response.sendRedirect(request.getContextPath() + "/ListResourcesServlet?taskId=" + tId);
        } catch (SQLException e) {
            throw new ServletException("Error adding resource", e);
        }
    }
}
