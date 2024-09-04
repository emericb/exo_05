<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="patients" scope="request" type="java.util.List<org.demo.exo_05.entity.Patient>"/>

<!DOCTYPE html>
<html>
<head>
    <title>Rechercher un Patient - Hôpital Placebo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .banner {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 1em 0;
        }
        .menu {
            text-align: center;
            margin: 1em 0;
        }
        .menu a {
            margin: 0 15px;
            text-decoration: none;
            color: #4CAF50;
        }
        .form-container {
            max-width: 600px;
            margin: 2em auto;
            padding: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container label {
            display: block;
            margin-bottom: 0.5em;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 0.5em;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 0.75em 1.5em;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .results {
            max-width: 600px;
            margin: 2em auto;
        }
        .footer {
            text-align: center;
            margin-top: 2em;
            padding: 1em 0;
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<div class="banner">
    <h1>Rechercher un Patient</h1>
</div>
<div class="menu">
    <a href="index.jsp">Accueil</a>
    <a href="createPatient.jsp">Créer un Patient</a>
    <a href="searchPatient.jsp">Rechercher un Patient</a>
</div>
<div class="form-container">
    <form action="search-patient" method="get">
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>
        <input type="submit" value="Rechercher">
    </form>
</div>
<div class="results">
    <h2>Liste des Patients</h2>
    <c:choose>
        <c:when test="${not empty patients}">
            <ul>
                <c:forEach var="patient" items="${patients}">
                    <li>${patient.nom} ${patient.prenom} - ${patient.dateDeNaissance}</li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <p>Aucun patient trouvé.</p>
        </c:otherwise>
    </c:choose>
</div>
<div class="footer">
    <p>© 2024 Hôpital Placebo, Tout droits réservés</p>
</div>
</body>
</html>