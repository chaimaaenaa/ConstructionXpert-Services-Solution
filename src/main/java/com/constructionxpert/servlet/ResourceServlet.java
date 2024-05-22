package com.constructionxpert.servlet;

import com.constructionxpert.dao.ResourceDAO;
import com.constructionxpert.dao.impl.ResourceDAOImpl;
import com.constructionxpert.model.Resource;
import com.constructionxpert.utils.DatabaseUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/resources")
public class ResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DatabaseUtils.getConnection();
        resourceDAO = new ResourceDAOImpl(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        List<Resource> resources = resourceDAO.getAllResourcesByProjectId(projectId);
        request.setAttribute("resources", resources);
        request.getRequestDispatcher("/resource-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            Resource resource = new Resource();
            resource.setName(request.getParameter("name"));
            resource.setType(request.getParameter("type"));
            resource.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            resource.setSupplierInfo(request.getParameter("supplierInfo"));
            resource.setProjectId(Integer.parseInt(request.getParameter("projectId")));
            resourceDAO.addResource(resource);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Resource resource = resourceDAO.getResourceById(id);
            if (resource != null) {
                resource.setName(request.getParameter("name"));
                resource.setType(request.getParameter("type"));
                resource.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                resource.setSupplierInfo(request.getParameter("supplierInfo"));
                resource.setProjectId(Integer.parseInt(request.getParameter("projectId")));
                resourceDAO.updateResource(resource);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            resourceDAO.deleteResource(id);
        }
        response.sendRedirect("resources?projectId=" + request.getParameter("projectId"));
    }
}
