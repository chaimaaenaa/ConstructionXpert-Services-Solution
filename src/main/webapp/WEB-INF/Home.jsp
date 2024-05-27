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


       .hero {
           position: relative;
           background: url("https://www.quodoc.com/media/get/large/37/bouw.jpg") no-repeat center center/cover;
           color: #F8BE0C;
           text-align: center;
           padding: 100px 20px;
           overflow: hidden;
       }

       .hero::before {
           content: "";
           position: absolute;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           background: rgba(0, 0, 0, 0.5); /* Adjust the opacity value as needed */
           z-index: 1;
       }

       .hero-content {
           position: relative;
           z-index: 2;
       }

       .hero h1 {
           font-size: 50px;
           margin-bottom: 10px;
       }

       .hero p {
           font-size: 24px;
           color: white;
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
       #tm-bg {
           position: fixed;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           background-position: center;
           background-size: cover;
           background-repeat: no-repeat;
           z-index: -1;
           animation: bgChange 9s infinite;
       }
       @keyframes bgChange {
           0% {
              background-color: white;
           }
           25% {
              background-color: #CCCCCC;
           }
           25.01% {
               background-image: url(https://www.apardion.co.uk/wp-content/uploads/2023/12/Apardion-Construction.webp);
           }
           50% {
               background-color: #F8BE0C;
           }
           50.01% {
            background-color: #F8BE0C;
           }
           75% {
              background-color: #5D6B7C;
           }
           75.01% {
               background-image: url(https://assets-global.website-files.com/622ae04fd98a7521ec394474/6312d7f55a579cea146e55f0_cps-services.jpg);
           }
           100% {
               background-color: white;
           }
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
           text-align: left;
       }

       .service-cards .card h3, .team-cards .card h3 {
           font-size: 24px;
           margin-bottom: 10px;
       }

       .service-cards .card .icon, .team-cards .card .icon {
           text-align: center;
           margin-bottom: 15px;
       }

       .service-cards .card .icon img, .team-cards .card .icon img {
           width: 60px;
           height: 60px;
           border-radius: 50%;

           padding: 10px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       }

       .history {
           padding: 50px 20px;
           background-color: #f9f9f9;
           background: #F8BE0C;
       }

       .history-content {
           display: flex;
           align-items: center;
           justify-content: space-between;
       }

       .history-text {
           max-width: 50%;
       }

       .history h2 {
           font-size: 36px;
           color: #333;
           position: relative;
           margin-bottom: 20px;
       }

       .history h2::after {
           content: '';
           position: absolute;
           left: 0;
           bottom: -10px;
           width: 50px;
           height: 4px;
           background-color: #ffd700;
       }

       .history p {
           color: #666;
           line-height: 1.6;
           margin-bottom: 20px;
       }

       .history-image {
           max-width: 45%;
       }

       .history-image img {
           width: 100%;
           border-radius: 10px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       }

       .history button {
           background: #ffd700;
           border: none;
           padding: 10px 20px;
           font-size: 18px;
           cursor: pointer;
           color: #fff;
           transition: background 0.3s ease;
       }

       .history button:hover {
           background: #ffae00;
       }
       .team {
           padding: 50px 20px;
           text-align: center;
       }

       .team h2 {
           font-size: 36px;
           margin-bottom: 10px;
       }

       .team h3 {
           font-size: 28px;
           margin-bottom: 40px;
           font-style: italic;
       }

       .team-cards {
           display: flex;
           justify-content: space-around;
           flex-wrap: wrap;
       }

       .team-cards .card {
           background: #f4f4f4;
           border-radius: 10px;
           padding: 20px;
           margin: 10px;
           flex: 1;
           max-width: 30%;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
           text-align: left;
           transition: transform 0.3s ease;
       }

       .team-cards .card:hover {
           transform: scale(1.05);
       }

       .team-cards .card img {
           width: 100%;
           height: auto;
           border-radius: 10px;
           margin-bottom: 15px;
       }

       .team-cards .card h3 {
           font-size: 24px;
           margin-bottom: 10px;
       }

       .team-cards .card p {
           font-size: 16px;
           color: #555;
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
       .con{
           width: 100px;
           height: 100px;
           border-radius: 100px;
       }
       .con{
           width: 50px;
           height: 50px;
           margin-top: 20px;

       }
       .bg{
           border-radius: 600px;
           background-color: #ffd700;
           width: 100px;
           height: 100px;
           margin-left: 50px;


       }

       .our{
           margin-left: 900px;
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
            <li><a href="${pageContext.request.contextPath}/Projects/listProjects">Projects</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
</header>
<main>

    <section class="hero">
        <div class="hero-content">
            <br><br><br><br>
            <h1>Welcome to CMHOUSE</h1><br>
            <p>Your project management tool see our recent projects see our recent projects </p><br>
            <br><br><br>

            <button>see our recent projects</button>
        </div>
    </section>
    <div id="tm-bg"></div>
    <section class="services">
        <h2>OUR SERVICES</h2>
        <div class="service-cards">
            <div class="card">
                <div class="icon">
                    <div  class="bg"><img src="https://i.ibb.co/D4Z2hWc/image-1.png" alt=""  class="con"></div>
                </div>
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
            <div class="card">
                <div class="icon">
                    <div  class="bg"><img src="https://i.ibb.co/4NffDBk/image-2-Copie.png" alt=""  class="con"></div>
                </div>
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
            <div class="card">
                <div class="icon">
                    <div  class="bg"><img src="https://i.ibb.co/rwGhvMC/image-3-Copie.png" alt=""  class="con"></div>
                </div>
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
            <div class="card">
                <div class="icon">
                    <div  class="bg"><img src="https://i.ibb.co/37y1Ht0/image-4-Copie.png" alt=""  class="con"></div>
                </div>
                <h3>BUILDING INFORMATION MODELING</h3>
                <p>Oftentimes physical and functional essence of any construction project needs to be represented digitally, in a 3D model format. In...</p>
            </div>
        </div>
    </section>
    <section class="history">
        <div class="history-content">
            <div class="history-text">
                <h2>OUR HISTORY</h2>
                <p>OUR CONSTRUCTION COMPANY HAS BEEN FOUNDED 10 YEARS AGO, AT THE VERY PEAK OF THE BUILDING FRENZY IN THE US...</p>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and correlating that were all involved in completing each separate project, then our productivity is immense!</p>
                <button>READ MORE</button>
            </div>
            <div class="history-image">
                <img src="https://i.ibb.co/8PtbzBp/our-hist.png" alt="Our History">
            </div>
        </div>
    </section>

    <section class="team">
        <h2>OUR TEAM</h2>
        <h3>Our Big Community</h3>
        <div class="team-cards">
            <div class="card">
                <img src="https://i.ibb.co/TWXq0HN/femmes-construction-femmes.jpg" alt="Team Member" class="con">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
            <div class="card">
                <img src="https://i.ibb.co/WVhNBy8/istockphoto-1346124841-612x612.jpg" alt="Team Member" class="con">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
            <div class="card">
                <img src="https://i.ibb.co/BLYPt4p/femmes-batiment-850.jpg" alt="Team Member" class="con">
                <h3>Executive Manager</h3>
                <p>Since then we’ve built hundreds of commercial, government and private buildings and facilities. It may not sound like a lot, but if you estimate the manpower, working hours, materials, planning and</p>
            </div>
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
<script src="script.js"></script>
</body>
</html>
