<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Liste des Ressources</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .navbar {
      background-color: #333;
      overflow: hidden;
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
    .resource-cards {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
      padding: 20px;
    }
    .resource-card {
      background-color: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 20px;
      width: calc(50% - 40px); /* Two cards per row */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .resource-card h2 {
      margin-top: 0;
    }
    .button-container {
      margin-top: 20px;
      display: flex;
      gap: 10px;
    }
    .update-button, .delete-button {
      padding: 10px 15px;
      border: none;
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
  </style>
</head>
<body>

<div class="navbar">
  <a href="${pageContext.request.contextPath}/listTask">Projects</a>
  <a href="${pageContext.request.contextPath}/AddResourceServlet?taskId=${taskId}">Add Resource</a>
</div>

<h1>Liste des Ressources</h1>
<div class="resource-cards">
  <c:forEach var="resource" items="${resources}">
    <div class="resource-card">
      <h2>${resource.rName}</h2>
      <p><strong>Type:</strong> ${resource.rType}</p>
      <p><strong>Quantité:</strong> ${resource.quantity}</p>
      <p><strong>Fournisseur:</strong> ${resource.provider}</p>
      <p><strong>ID Tâche:</strong> ${resource.tId}</p>
      <div class="button-container">
        <a href="${pageContext.request.contextPath}/UpdateResourceServlet?resourceId=${resource.rId}&taskId=${taskId}" class="update-button">Update</a>
        <a href="${pageContext.request.contextPath}/DeleteResourceServlet?resourceId=${resource.rId}&taskId=${taskId}" class="delete-button">Delete</a>
      </div>
    </div>
  </c:forEach>
</div>
</body>
</html>
