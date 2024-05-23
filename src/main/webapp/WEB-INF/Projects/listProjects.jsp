<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Liste des Projets</title>
  <style>
    .project-cards {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
    }

    .project-card {
      background-color: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 20px;
      width: calc(50% - 40px); /* Two cards per row */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .project-card h2 {
      margin-top: 0;
    }

    .button-container {
      margin-top: 20px;
      display: flex;
      gap: 10px;
    }

    .task-button, .update-button, .delete-button {
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      text-decoration: none;
      color: #fff;
    }

    .task-button {
      background-color: #28a745;
    }

    .update-button {
      background-color: #007bff;
    }

    .delete-button {
      background-color: #dc3545;
    }
  </style>
</head>
<body>
<h1>Liste des Projets</h1>
<a href="${pageContext.request.contextPath}/AddProjectServlet" class="add-button">Ajouter un Nouveau Projet</a>
<div class="project-cards">
  <c:forEach var="project" items="${listProjects}">
    <div class="project-card">
      <h2>${project.pName}</h2>
      <p><strong>Description:</strong> ${project.pDescription}</p>
      <p><strong>Date de Début:</strong> ${project.pStartdate}</p>
      <p><strong>Date de Fin:</strong> ${project.pEndDate}</p>
      <p><strong>Budget:</strong> ${project.budget}</p>
      <div class="button-container">
        <a href="${pageContext.request.contextPath}/ListTasksServlet?projectId=${project.pId}" class="task-button">See All Tasks</a>
        <a href="${pageContext.request.contextPath}/UpdateProjectServlet?projectId=${project.pId}" class="update-button">Update</a>
        <a href="${pageContext.request.contextPath}/DeleteProjectServlet?projectId=${project.pId}" class="delete-button">Delete</a>
      </div>
    </div>
  </c:forEach>
</div>
</body>
</html>
