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
        main {
            padding: 20px;
        }

        .task-list {
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .task-list h1 {
            color: #f4c542;
            font-size: 2em;
        }

        .add-new-task {
            background-color: #f4c542;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .task-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .task-card {
            background-color: #444c5c;
            color: white;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: left;
            border: 3px solid #f4c542;
        }

        .task-card h2 {
            color: #f4c542;
            margin-top: 0;
        }

        .task-card p {
            margin: 5px 0;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        .button-container button {
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
        }

        .resources-button {
            background-color: #28a745;
        }

        .update-button {
            background-color:#F8BE0C;
        }

        .delete-button {
            background-color: #dc3545;
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

<main>
    <section class="task-list">
        <h1>Liste des Tâches</h1>
        <button class="add-new-task" onclick="location.href='${pageContext.request.contextPath}/AddTaskServlet?projectId=${projectId}'">+ Ajouter une nouvelle Tache</button>
        <div class="task-cards">
            <c:forEach var="task" items="${tasks}">
                <div class="task-card">
                    <h2>Suivi des projets</h2>
                    <p><strong>Description:</strong> ${task.tDescription}</p>
                    <p><strong>Date de début:</strong> ${task.tStartdate}</p>
                    <p><strong>Date de Fin:</strong> ${task.tEndDate}</p>
                    <p><strong>Statut:</strong> ${task.statut}</p>
                    <p><strong>Ressources:</strong> ${task.resources}</p>
                    <div class="button-container">
                        <button class="resources-button" onclick="location.href='${pageContext.request.contextPath}/ListResourcesServlet?taskId=${task.tId}'">See All Resources</button>
                        <button class="update-button" onclick="location.href='${pageContext.request.contextPath}/UpdateTaskServlet?taskId=${task.tId}&projectId=${projectId}'">Update</button>
                        <button class="delete-button" onclick="location.href='${pageContext.request.contextPath}/DeleteTaskServlet?taskId=${task.tId}&projectId=${projectId}'">Delete</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</main>
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
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const deleteButtons = document.querySelectorAll('.delete-button');
        deleteButtons.forEach(button => {
            button.addEventListener('click', () => {
                const taskCard = button.closest('.task-card');
                taskCard.remove();
            });
        });
    });

</script>

</body>
</html>
