<%@ page import="java.util.List" %>
<%@ page import="com.build.classes.Project" %>
<%@ page import="com.build.servlets.ProjectServlet" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Project Management</h1>

    <h2 class="mt-4">Add New Project</h2>
    <form action="ProjectServlet?action=addProject" method="post">
        <div class="form-group">
            <label for="name">Project Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" required></textarea>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date:</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date:</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="budget">Budget:</label>
            <input type="number" class="form-control" id="budget" name="budget" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Project</button>
    </form>

    <h2 class="mt-5">Existing Projects</h2>
    <div class="row">
        <c:forEach var="project" items="${projects}">
            <div class="col-md-4">
                <div class="card mt-4">
                    <div class="card-header">
                        Project: ${project.name}
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${project.name}</h5>
                        <p class="card-text">${project.description}</p>
                        <p class="card-text">Start Date: <c:out value="${project.startDate != null ? project.startDate : 'N/A'}"/></p>
                        <p class="card-text">End Date: <c:out value="${project.endDate != null ? project.endDate : 'N/A'}"/></p>
                        <p class="card-text">Budget: ${project.budget}</p>
                        <form action="EditProjectServlet" method="get" style="display: inline;">
                            <input type="hidden" name="id" value="${project.project_id}" />
                            <button type="submit" class="btn btn-warning btn-sm">Edit</button>
                        </form>
                        <form action="DeleteServlet" method="post" style="display: inline;">
                            <input type="hidden" name="action" value="delete" />
                            <input type="hidden" name="projectId" value="${project.project_id}" />
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
