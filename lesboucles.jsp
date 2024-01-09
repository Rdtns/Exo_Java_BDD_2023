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
        <p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
        <%
            // Boucle pour afficher un triangle rectangle gauche
            for (int i = 1; i <= cpt; i++) {
        %>
            <p><%= "*".repeat(i) %></p>
        <%
            }
        %>

        <h2>Exercice 3 : Triangle rectangle inversé</h2>
        <p>Ecrire le code afin de produire un triangle rectangle inversé aligné sur la gauche</p>
        <%
            // Boucle pour afficher un triangle rectangle inversé gauche
            for (int i = cpt; i >= 1; i--) {
        %>
            <p><%= "*".repeat(i) %></p>
        <%
            }
        %>

        <h2>Exercice 4 : Triangle rectangle 2</h2>
        <p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
        <%
            // Boucle pour afficher un triangle rectangle droit
            for (int i = 1; i <= cpt; i++) {
        %>
            <p><%= "&nbsp;".repeat(cpt - i) + "*".repeat(i) %></p>
        <%
            }
        %>

        <h2>Exercice 5 : Triangle isocele</h2>
        <p>Ecrire le code afin de produire un triangle isocele aligné sur la droite</p>
        <%
            // Boucle pour afficher un triangle isocele droit
            for (int i = 1; i <= cpt; i++) {
        %>
            <p><%= "&nbsp;".repeat(cpt - i) + "*".repeat(i) %></p>
        <%
            }
        %>

        <h2>Exercice 6 : Le demi losange</h2>
        <p>Ecrire le code afin de produire un demi losange</p>
        <%
            // Boucle pour afficher la moitié d'un losange
            for (int i = 1; i <= cpt; i++) {
        %>
            <p><%= "&nbsp;".repeat(cpt - i) + "*".repeat(i) %></p>
        <%
            }

            // Boucle pour afficher l'autre moitié du losange
            for (int i = cpt - 1; i >= 1; i--) {
        %>
            <p><%= "&nbsp;".repeat(cpt - i) + "*".repeat(i) %></p>
        <%
            }
        %>

        <h2>Exercice 7 : La table de multiplication</h2>
        <p>Ecrire le code afin de créer une table de multiplication</p>
        <%
            // Boucle pour afficher une table de multiplication
            for (int i = 1; i <= 10; i++) {
        %>
            <p><%= cpt %> x <%= i %> = <%= cpt * i %></p>
        <%
            }
        %>

    <% } %>
    
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
