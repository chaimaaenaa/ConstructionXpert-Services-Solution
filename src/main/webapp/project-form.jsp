<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Form</title>
</head>
<body>
<h2>${project.id == null ? 'Add New Project' : 'Edit Project'}</h2>
<form action="project" method="post">
    <input type="hidden" name="id" value="${project.id}" />
    <label for="name">Project Name:</label>
    <input type="text" name="name" id="name" value="${project.name}" required /><br/>
    <label for="description">Description:</label>
    <input type="text" name="description" id="description" value="${project.description}" required /><br/>
    <label for="start_date">Start Date:</label>
    <input type="date" name="start_date" id="start_date" value="${project.startDate}" required /><br/>
    <label for="end_date">End Date:</label>
    <input type="date" name="end_date" id="end_date" value="${project.endDate}" required /><br/>
    <label for="budget">Budget:</label>
    <input type="number" name="budget" id="budget" value="${project.budget}" required /><br/>
    <input type="submit" value="Save" />
</form>
<a href="project">Back to Project List</a>
</body>
</html>
