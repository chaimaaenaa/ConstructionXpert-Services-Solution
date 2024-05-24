<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Liste des Projets</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      box-sizing: border-box;
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
    main {
      padding: 20px;
    }

    .project-list {
      max-width: 800px;
      margin: 0 auto;
      text-align: center;
    }

    .project-list h1 {
      color: #f4c542;
      font-size: 2em;
    }

    .add-new-project {
      background-color: #f4c542;
      border: none;
      color: white;
      padding: 10px 20px;
      font-size: 16px;
      cursor: pointer;
      margin-bottom: 20px;
    }

    .project-card {
      background-color: #444c5c;
      color: white;
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 20px;
      position: relative;
      border: 3px solid #f4c542;
      text-align: left;
    }

    .project-card h2 {
      color: #f4c542;
      margin-top: 0;
    }

    .project-card button {
      border: none;
      color: white;
      padding: 10px 20px;
      cursor: pointer;
      border-radius: 5px;
      margin-right: 10px;
    }

    .see-tasks {
      background-color: #3cba54;
    }

    .update {
      background-color: #4285f4;
    }

    .delete {
      background-color: #db3236;
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

    .project-cards {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
    }

    .project-card {
      background-color: #5D6B7C;
      border: 1px solid #F8BE0C;
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
<header>
  <div class="logo">
    <img src="img/logo.png" alt="CMHOUSE Logo">
  </div>
  <nav>
    <ul>
      <li><a href="Home.jsp">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="listProjects.jsp">Projects</a></li>
      <li><a href="/WEB-INF/Tasks/listTasks.jsp">Task</a></li>
      <li><a href="/WEB-INF/Resources/listResources.jsp">Resources</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>
</header>
<h1>Liste des Projets</h1>
<button class="add-new-project"><a href="${pageContext.request.contextPath}/AddProjectServlet" class="add-button">+ Ajouter un Nouveau Projet</a></button>

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
<footer>
  <div class="footer-content">
    <div class="logo">
      <img src="img/logo.png" alt="CMHOUSE Logo">
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
      <a href="#"><img src="img/google-plus.png" alt="Google"></a>
      <a href="#"><img src="img/email.png" alt="Email"></a>
      <a href="#"><img src="img/facebook.png" alt="Facebook"></a>
      <a href="#"><img src="img/twitter.png" alt="Twitter"></a>
    </div>
  </div>
</footer>
</body>
</html>
