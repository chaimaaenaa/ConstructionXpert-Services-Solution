<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Project</title>
    <style>

    </style>
</head>
<body>
<h1>Update Project</h1>
<form action="${pageContext.request.contextPath}/UpdateProjectServlet" method="POST">

    <input type="hidden" name="id" value="${project.pId}"/>

    <label for="name">Project Name:</label>
    <input type="text" id="name" name="name" value="${project.pName}" required/>

    <label for="description">Description:</label>
    <input type="text" id="description" name="description" value="${project.pDescription}" required/>

    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate" value="${project.pStartdate}" required/>

    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate" value="${project.pEndDate}" required/>

    <label for="budget">Budget:</label>
    <input type="text" id="budget" name="budget" value="${project.budget}"  required/>

    <input type="submit" value="Update Project"/>
</form>
</body>
</html>
