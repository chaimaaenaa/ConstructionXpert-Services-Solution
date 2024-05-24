<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24/05/2024
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
   <style>
       * {
           margin: 0;
           padding: 0;
           box-sizing: border-box;
       }

       body {
           font-family: Arial, sans-serif;
           line-height: 1.6;
       }

       header {
           background: rgba(9, 30, 55, 0.62);
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

       .hero {
           background: url('hero.jpg') no-repeat center center/cover;
           color: #fff;
           text-align: center;
           padding: 100px 20px;
       }

       .hero h2 {
           font-size: 48px;
           margin-bottom: 10px;
       }

       .hero p {
           font-size: 24px;
           margin-bottom: 20px;
       }

       .hero button {
           background: #ffd700;
           border: none;
           padding: 10px 20px;
           font-size: 18px;
           cursor: pointer;
       }

       .hero button:hover {
           background: #ffae00;
       }

       .services, .history, .team {
           padding: 50px 20px;
           text-align: center;
       }

       .services h2, .history h2, .team h2 {
           font-size: 36px;
           margin-bottom: 20px;
       }

       .service-cards, .team-cards {
           display: flex;
           justify-content: space-around;
           flex-wrap: wrap;
       }

       .service-cards .card, .team-cards .card {
           background: #f4f4f4;
           border-radius: 10px;
           padding: 20px;
           margin: 10px;
           flex: 1;
           max-width: 45%;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       }

       .service-cards .card h3, .team-cards .card h3 {
           font-size: 24px;
           margin-bottom: 10px;
       }

       .history p {
           max-width: 800px;
           margin: 20px auto;
       }

       .history button {
           background: #ffd700;
           border: none;
           padding: 10px 20px;
           font-size: 18px;
           cursor: pointer;
       }

       .history button:hover {
           background: #ffae00;
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

   </style>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}../img/logo.png" alt="CMHOUSE Logo">
        <h1>CMHOUSE</h1>

    </div>
    <nav>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="${pageContext.request.contextPath}/Projects/listProjects">Projects</a></li>
            <li><a href="${pageContext.request.contextPath}/ListTasksServlet">Task</a></li>
            <li><a href="${pageContext.request.contextPath}/ListResourcesServlet">Resources</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="hero">
        <h2>ConstructionXpert</h2>
        <p>SEE HOW A 10-STORIES TOWER'S BEING BUILT, IN A TIME-LAPSE!</p>
        <button>see our recent projects</button>
    </section>
    <section class="services">
        <h2>OUR SERVICES</h2>
        <div class="service-cards">
            <div class="card">
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
            <div class="card">
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
            <div class="card">
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
            <div class="card">
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
        </div>
    </section>
    <section class="history">
        <h2>OUR HISTORY</h2>
        <p>OUR CONSTRUCTION COMPANY HAS BEEN FOUNDED 10 YEARS AGO, AT THE VERY PEAK OF THE BUILDING FRENZY IN THE US...</p>
        <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and correlating that were all involved in completing each separate project, then our productivity is immense!</p>
        <button>READ MORE</button>
    </section>
    <section class="team">
        <h2>OUR TEAM</h2>
        <h3>Our Big Community</h3>
        <div class="team-cards">
            <div class="card">
                <img src="team1.jpg" alt="Team Member">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
            <div class="card">
                <img src="team2.jpg" alt="Team Member">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
            <div class="card">
                <img src="team3.jpg" alt="Team Member">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
            <div class="card">
                <img src="team4.jpg" alt="Team Member">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
        </div>
    </section>
</main>
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
<script src="script.js"></script>
</body>
</html>
