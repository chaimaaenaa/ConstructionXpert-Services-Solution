<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Tâches</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
            padding: 10px;
            margin-bottom: 20px;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .task-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px;
        }
        .task-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            width: 300px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .task-card h2 {
            margin-top: 0;
        }
        .task-card p {
            margin: 5px 0;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
        .button-container a {
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
        }
        .update-button {
            background-color: #007bff;
        }
        .delete-button {
            background-color: #dc3545;
        }
        .resources-button {
            background-color: #28a745;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="${pageContext.request.contextPath}/listProject">Projects</a>
    <a href="${pageContext.request.contextPath}/AddTaskServlet?projectId=${projectId}">Add Task</a>
</div>

<h2>Liste des Tâches</h2>

<div class="task-cards">
    <c:forEach var="task" items="${tasks}">
        <div class="task-card">
            <h2>${task.tDescription}</h2>
            <p><strong>Description:</strong> ${task.tDescription}</p>
            <p><strong>Date de Début:</strong> ${task.tStartdate}</p>
            <p><strong>Date de Fin:</strong> ${task.tEndDate}</p>
            <p><strong>Statut:</strong> ${task.statut}</p>
            <p><strong>Ressources:</strong> ${task.resources}</p>
            <div class="button-container">
                <a href="${pageContext.request.contextPath}/UpdateTaskServlet?taskId=${task.tId}&projectId=${projectId}" class="update-button">Update</a>
                <a href="${pageContext.request.contextPath}/DeleteTaskServlet?taskId=${task.tId}&projectId=${projectId}" class="delete-button">Delete</a>
                <a href="${pageContext.request.contextPath}/ListResourcesServlet?taskId=${task.tId}" class="resources-button">See All Resources</a>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
