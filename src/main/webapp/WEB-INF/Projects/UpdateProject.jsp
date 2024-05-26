<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            max-width: 600px;
            margin: auto;
            padding: 1em;
            border: 1px solid #ccc;
            border-radius: 1em;
        }
        div.form-group {
            margin-bottom: 1em;
        }
        label {
            margin-bottom: .5em;
            color: #333333;
            display: block;
        }
        input, textarea {
            border: 1px solid #CCCCCC;
            padding: .5em;
            font-size: 1em;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="submit"] {
            padding: 0.7em;
            color: #fff;
            background-color: #F8BE0C;
            border: none;
            border-radius: .3em;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #F8BE0C;
        }
    </style>
</head>
<body>
<h1>Update Project</h1>
<form action="${pageContext.request.contextPath}/UpdateProjectServlet" method="POST">
    <input type="hidden" name="id" value="${project.pId}"/>
    <div class="form-group">
        <label for="name">Nom du Projet:</label>
        <input type="text" id="name" name="name" value="${project.pName}" required/>
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="${project.pDescription}" required/>
    </div>
    <div class="form-group">
        <label for="startDate">Date de Début:</label>
        <input type="date" id="startDate" name="startDate" value="${project.pStartdate}" required/>
    </div>
    <div class="form-group">
        <label for="endDate">Date de Fin:</label>
        <input type="date" id="endDate" name="endDate" value="${project.pEndDate}" required/>
    </div>
    <div class="form-group">
        <label for="budget">Budget:</label>
        <input type="text" id="budget" name="budget" value="${project.budget}"  required/>
    </div>
    <input type="submit" value="Update Project"/>
</form>
</body>
</html>
