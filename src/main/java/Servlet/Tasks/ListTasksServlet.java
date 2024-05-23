package Servlet.Tasks;

import DaoImp.TaskDaoImp;
import Model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ListTasksServlet")
public class ListTasksServlet extends HttpServlet {
    private TaskDaoImp taskDao;

    @Override
    public void init() {
        taskDao = new TaskDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        try {
            List<Task> tasks = taskDao.selectAllTasks(projectId);
            request.setAttribute("tasks", tasks);
            request.setAttribute("projectId", projectId);
            request.getRequestDispatcher("/WEB-INF/Tasks/listTasks.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving tasks", e);
        }
    }
}
