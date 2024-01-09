<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Boucles</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les boucles</h1>
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie par l'utilisateur --%>
    <% String valeur = request.getParameter("valeur"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur != null && !valeur.isEmpty()) { %>

        <h2>Exercice 1 : Le carré d'étoiles</h2>
        <p>Ecrire le code afin de produire un carré d'étoiles</p>

        <%
            // Boucle pour afficher un carré d'étoiles
            int cpt = Integer.parseInt(valeur);
            for (int i = 0; i < cpt; i++) {
        %>
            <p><%= "*".repeat(cpt) %></p>
        <%
            }
        %>

        <h2>Exercice 2 : Triangle rectangle gauche</h2>
        <!-- Ajoutez ici le code pour l'exercice 2 -->

        <h2>Exercice 3 : Triangle rectangle inversé</h2>
        <!-- Ajoutez ici le code pour l'exercice 3 -->

        <h2>Exercice 4 : Triangle rectangle 2</h2>
        <!-- Ajoutez ici le code pour l'exercice 4 -->

        <h2>Exercice 5 : Triangle isocele</h2>
        <!-- Ajoutez ici le code pour l'exercice 5 -->

        <h2>Exercice 6 : Le demi losange</h2>
        <!-- Ajoutez ici le code pour l'exercice 6 -->

        <h2>Exercice 7 : La table de multiplication</h2>
        <!-- Ajoutez ici le code pour l'exercice 7 -->

    <% } %>
    
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

