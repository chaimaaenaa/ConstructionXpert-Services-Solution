<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mettre à jour une Tâche</title>
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
        .form-group input[type="text"], .form-group input[type="date"], .form-group select {
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
    <h2>Mettre à jour une Tâche</h2>
    <form action="${pageContext.request.contextPath}/UpdateTaskServlet" method="POST">
        <input type="hidden" name="projectId" value="${projectId}">
        <input type="hidden" name="tId" value="${task.tId}">
        <div class="form-group">
            <label for="description">Description de la Tâche:</label>
            <input type="text" id="description" name="tDescription" value="${task.tDescription}" required>
        </div>
        <div class="form-group">
            <label for="startDate">Date de Début:</label>
            <input type="date" id="startDate" name="tStartDate" value="${task.tStartdate}" required>
        </div>
        <div class="form-group">
            <label for="endDate">Date de Fin:</label>
            <input type="date" id="endDate" name="tEndDate" value="${task.tEndDate}" required>
        </div>
        <div class="form-group">
            <label for="status">Statut:</label>
            <select id="status" name="status" required>
                <option value="A faire" ${task.statut == 'A faire' ? 'selected' : ''}>A faire</option>
                <option value="En cours" ${task.statut == 'En cours' ? 'selected' : ''}>En cours</option>
                <option value="Terminé" ${task.statut == 'Terminé' ? 'selected' : ''}>Terminé</option>
            </select>
        </div>
        <div class="form-group">
            <label for="resources">Ressources:</label>
            <input type="text" id="resources" name="resources" value="${task.resources}" required>
        </div>
        <div class="form-group">
            <button type="submit">Update Task</button>
        </div>
    </form>
</div>

</body>
</html>
