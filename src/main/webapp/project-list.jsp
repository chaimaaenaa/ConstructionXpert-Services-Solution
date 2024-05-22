<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project List</title>
</head>
<body>
<h2>Project List</h2>
<a href="project?action=new">Add New Project</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Budget</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="project" items="${listProjects}">
        <tr>
            <td>${project.id}</td>
            <td>${project.name}</td>
            <td>${project.description}</td>
            <td>${project.startDate}</td>
            <td>${project.endDate}</td>
            <td>${project.budget}</td>
            <td>
                <a href="project?action=edit&id=${project.id}">Edit</a>
                <a href="project?action=delete&id=${project.id}" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
