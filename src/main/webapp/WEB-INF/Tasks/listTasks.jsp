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
        header {
            background: #555;
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header .logo {
            display: flex;
            align-items: center;
            padding-left: 20px;
        }

        header .logo img {
            width: 50px;
        }

        header .logo h1 {
            margin-left: 10px;
            font-size: 24px;
        }

        header nav ul {
            list-style: none;
            display: flex;
        }

        header nav ul li {
            margin: 0 10px;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
        }

        header nav ul li a:hover {
            color: #ffd700;
        }
        footer {
            background: #555;
            color: #fff;
            padding: 20px 0;
        }

        footer .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        footer .logo {
            display: flex;
            align-items: center;
        }

        footer .logo img {
            width: 50px;
        }

        footer .logo h1 {
            margin-left: 10px;
            font-size: 24px;
        }

        footer .footer-info {
            display: flex;
            justify-content: space-around;
            flex: 1;
        }

        footer .footer-info div {
            margin: 0 20px;
        }

        footer .footer-info h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        footer .social a {
            margin: 0 10px;
        }

        footer .social img {
            width: 24px;
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
            background-color: #F8BE0C;
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
<header>
    <div class="logo">
        <img src="https://i.ibb.co/kcztT0J/BG.png" alt="CMHOUSE Logo">
        <h1>CMHOUSE</h1>

    </div>
    <nav>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
</header>

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
<footer>
    <div class="footer-content">
        <div class="logo">
            <img src="https://i.ibb.co/kcztT0J/BG.png" alt="CMHOUSE Logo">
            <h1>CMHOUSE</h1>
            <p>CONSTRUCTIONXPERT</p>
        </div>
        <div class="footer-info">
            <div class="about">
                <h3>About</h3>
                <p>Executive Manager</p>
                <p>Executive Manager</p>
                <p>Executive Manager</p>
            </div>
            <div class="contact">
                <h3>Contact</h3>
                <p>Executive Manager</p>
                <p>Executive Manager</p>
                <p>Executive Manager</p>
            </div>
        </div>
        <div class="social">
            <a href="#"><img src="https://i.ibb.co/XFLW3fK/google-plus.png" alt="Google"></a>
            <a href="#"><img src="https://i.ibb.co/DCpNVsV/email.png" alt="Email"></a>
            <a href="#"><img src="https://i.ibb.co/Sf5yT0f/facebook.png" alt="Facebook"></a>
            <a href="#"><img src="https://i.ibb.co/9qFvXM4/twitter.png" alt="Twitter"></a>
            <a href="#"><img src="https://i.ibb.co/W2PJQ7q/instagram.png" alt="Instagram"></a>
        </div>
    </div>
</footer>

</body>
</html>
