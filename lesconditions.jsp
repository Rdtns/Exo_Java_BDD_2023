<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>les conditions</title>
</head>
<body bgcolor=white>
    <h1>Exercices sur les conditions</h1>
    <form action="#" method="post">
        <p>Saisir la valeur 1 : <input type="text" id="inputValeur1" name="valeur1"></p>
        <p>Saisir la valeur 2 : <input type="text" id="inputValeur2" name="valeur2"></p>
        <p>Saisir la valeur 3 : <input type="text" id="inputValeur3" name="valeur3"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>
    <% String valeur3 = request.getParameter("valeur3"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null && valeur3 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        <% int intValeur3 = Integer.parseInt(valeur3); %>

        <%-- Condition if pour comparer les valeurs (Exercice 1) --%>
        <h2>Exercice 1 : Comparaison 1</h2>
        <p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
        A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
        Exemple :</br>
        A = 10</br>
        B = 20</br>
        C = 15</br>
        Oui C est compris entre A et B</p>

        <% if (intValeur3 >= intValeur1 && intValeur3 <= intValeur2) { %>
            <p>Oui, la valeur de C est comprise entre A et B.</p>
        <% } else { %>
            <p>Non, la valeur de C n'est pas comprise entre A et B.</p>
        <% } %>

        <%-- Condition if pour déterminer si le nombre est pair ou impair (Exercice 2) --%>
        <h2>Exercice 2 : Pair ou Impair ?</h2>
        <p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>

        <% if (intValeur1 % 2 == 0) { %>
            <p>La valeur de A est pair.</p>
        <% } else { %>
            <p>La valeur de A est impair.</p>
        <% } %>

        <% if (intValeur2 % 2 == 0) { %>
            <p>La valeur de B est pair.</p>
        <% } else { %>
            <p>La valeur de B est impair.</p>
        <% } %>

        <% if (intValeur3 % 2 == 0) { %>
            <p>La valeur de C est pair.</p>
        <% } else { %>
            <p>La valeur de C est impair.</p>
        <% } %>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
