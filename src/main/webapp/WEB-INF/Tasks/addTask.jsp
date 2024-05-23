<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Ajouter une Tâche</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .form-container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
    .form-container h2 {
      margin-top: 0;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      display: block;
      font-weight: bold;
    }
    .form-group input[type="text"],
    .form-group input[type="date"],
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-sizing: border-box;
    }
    .form-group button {
      padding: 10px 20px;
      background-color: #F8BE0C;
      border: none;
      border-radius: 5px;
      color: #fff;
      cursor: pointer;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Tasks</h2>
  <form action="${pageContext.request.contextPath}/AddTaskServlet" method="POST">
    <div class="form-group">
      <label for="description">Description de la Tâche:</label>
      <input type="text" id="description" name="tDescription" required>
    </div>
    <div class="form-group">
      <label for="startDate">Date de Début:</label>
      <input type="date" id="startDate" name="tStartDate" required>
    </div>
    <div class="form-group">
      <label for="endDate">Date de Fin:</label>
      <input type="date" id="endDate" name="tEndDate" required>
    </div>
    <div class="form-group">
      <label for="status">Statut:</label>
      <select id="status" name="status" required>
        <option value="A faire">A faire</option>
        <option value="En cours">En cours</option>
        <option value="Terminé">Terminé</option>
      </select>
    </div>
    <div class="form-group">
      <label for="resources">Ressources:</label>
      <input type="text" id="resources" name="resources" required>
    </div>
    <div class="form-group">
      <input type="hidden" id="projectId" name="projectId" value="${projectId}">
    </div>
    <div class="form-group">
      <button type="submit">Add Task</button>
    </div>
  </form>
</div>

</body>
</html>
