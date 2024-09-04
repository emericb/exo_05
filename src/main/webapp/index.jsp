<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Accueil - Hôpital Placebo</title>
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
        .about {
            margin: 2em 0;
            text-align: center;
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
    <h1>Bienvenue à l'Hôpital Placebo</h1>
</div>
<div class="menu">
    <a href="index.jsp">Accueil</a>
    <a href="createPatient.jsp">Créer un Patient</a>
    <a href="searchPatient.jsp">Rechercher un Patient</a>
</div>
<div class="about">
    <h2>À propos de nous</h2>
    <p>Bienvenue à l'Hôpital Placebo, où nous nous engageons à fournir les meilleurs soins de santé à nos patients.</p>
</div>
<div class="footer">
    <p>© 2024 Hôpital Placebo, Tout doigts non coupés</p>
</div>
</body>
</html>