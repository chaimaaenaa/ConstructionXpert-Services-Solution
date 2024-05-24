<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert</title>
    <style> <%@include file="../CSS/style.css"%></style>
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="/WEB-INF/img/logo.png" alt="CMHOUSE Logo">
        <h1>CMHOUSE</h1>

    </div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contectPath}/">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="">Projects</a></li>
            <li><a href="">Task</a></li>
            <li><a href="">Resources</a></li>
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