<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Ajouter une Ressource</title>
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
    .form-group input[type="text"], .form-group input[type="number"], .form-group select {
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
  <h2>Ajouter une Ressource</h2>
  <form action="${pageContext.request.contextPath}/AddResourceServlet" method="POST">
    <div class="form-group">
      <label for="rName">Nom de la Ressource:</label>
      <input type="text" id="rName" name="rName" required>
    </div>
    <div class="form-group">
      <label for="rType">Type de la Ressource:</label>
      <input type="text" id="rType" name="rType" required>
    </div>
    <div class="form-group">
      <label for="quantity">Quantité:</label>
      <input type="number" id="quantity" name="quantity" required>
    </div>
    <div class="form-group">
      <label for="provider">Fournisseur:</label>
      <input type="text" id="provider" name="provider" required>
    </div>
    <div class="form-group">
      <input type="hidden" id="tId" name="tId" value="${taskId}">
    </div>
    <div class="form-group">
      <button type="submit">Ajouter</button>
    </div>
  </form>
</div>

</body>
</html>
