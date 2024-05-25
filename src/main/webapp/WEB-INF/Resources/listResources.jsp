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
    main {
      padding: 20px;
    }

    .resources {
      text-align: center;
    }

    .add-resource-btn {
      background-color: #FFC107;
      border: none;
      padding: 15px 30px;
      font-size: 18px;
      color: white;
      cursor: pointer;
      margin-bottom: 20px;
    }

    .resource-card {
      background-color: #FFB300;
      border-radius: 10px;
      padding: 20px;
      margin: 20px auto;
      width: 80%;
      max-width: 600px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
      text-align: left;
      color: white;
      font-size: 16px;
    }

    .resource-card h2 {
      margin-bottom: 10px;
    }

    .resource-card p {
      margin-bottom: 8px;
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
  <a href="${pageContext.request.contextPath}/listTask">Projects</a>
  <a href="${pageContext.request.contextPath}/AddResourceServlet?taskId=${taskId}">Add Resource</a>
</div>

<main>
  <section class="resources">
    <h1>Liste des Ressources</h1>
    <button class="add-resource-btn"> <a href="${pageContext.request.contextPath}/AddResourceServlet?taskId=${taskId}">+ Ajouter un Nouveau Ressources</a></button>
<c:forEach var="resource" items="${resources}">
    <div class="resource-card">
     <h2>${resource.rName}</h2>
      <p><strong>Type:</strong> ${resource.rType}/p>
      <p><strong>Quantité:</strong> ${resource.quantity}</p>
      <p><strong>Fournisseur:</strong> ${resource.provider}</p>
      <p><strong>ID Tache:</strong> ${resource.tId}</p>
  <div class="button-container">
  <a href="${pageContext.request.contextPath}/UpdateResourceServlet?resourceId=${resource.rId}&taskId=${taskId}" class="update-button">Update</a>
  <a href="${pageContext.request.contextPath}/DeleteResourceServlet?resourceId=${resource.rId}&taskId=${taskId}" class="delete-button">Delete</a>
  </div>
    </div>
</c:forEach>
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
  document.addEventListener('DOMContentLoaded', function() {
    const addResourceBtn = document.querySelector('.add-resource-btn');
    addResourceBtn.addEventListener('click', function() {
      alert('Ajouter un nouveau ressource functionality will be implemented.');
    });

    const updateBtns = document.querySelectorAll('.update-btn');
    updateBtns.forEach(btn => {
      btn.addEventListener('click', function() {
        alert('Update resource functionality will be implemented.');
      });
    });

    const deleteBtns = document.querySelectorAll('.delete-btn');
    deleteBtns.forEach(btn => {
      btn.addEventListener('click', function() {
        alert('Delete resource functionality will be implemented.');
      });
    });
  });

</script>
</body>
</html>
