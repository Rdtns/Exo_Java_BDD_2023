<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor=white>
    <h1>Exercices sur les tableaux</h1>
    <form action="#" method="post">
        <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

        <%-- Division de la chaîne de chiffres séparés par des espaces --%>
        <% String[] tableauDeChiffres = chaine.split("\\s+"); %>

        <%-- Conversion des valeurs en tableau d'entiers --%>
        <% int[] tableauEntiers = new int[tableauDeChiffres.length];
           for (int i = 0; i < tableauDeChiffres.length; i++) {
               tableauEntiers[i] = Integer.parseInt(tableauDeChiffres[i]);
           }
        %>

        <p>Le tableau contient <%= tableauEntiers.length %> valeurs</br>
        Chiffre 1 : <%= tableauEntiers[0] %></br>
        Chiffre 2 : <%= tableauEntiers[1] %></br>
        Chiffre 3 : <%= tableauEntiers[2] %></p>

        <h2>Exercice 1 : Le carré de la première valeur</h2>
        <p>Le carré de la première valeur est : <%= tableauEntiers[0] * tableauEntiers[0] %></p>

        <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
        <p>La somme des deux premières valeurs est : <%= tableauEntiers[0] + tableauEntiers[1] %></p>

        <h2>Exercice 3 : La somme de toutes les valeurs</h2>
        <% int somme = 0;
           for (int valeur : tableauEntiers) {
               somme += valeur;
           }
        %>
        <p>La somme de toutes les valeurs est : <%= somme %></p>

        <h2>Exercice 4 : La valeur maximum</h2>
        <% int valeurMax = Integer.MIN_VALUE;
           for (int valeur : tableauEntiers) {
               valeurMax = Math.max(valeurMax, valeur);
           }
        %>
        <p>La valeur maximale saisie par l'utilisateur est : <%= valeurMax %></p>

        <h2>Exercice 5 : La valeur minimale</h2>
        <% int valeurMin = Integer.MAX_VALUE;
           for (int valeur : tableauEntiers) {
               valeurMin = Math.min(valeurMin, valeur);
           }
        %>
        <p>La valeur minimale saisie par l'utilisateur est : <%= valeurMin %></p>

        <h2>Exercice 6 : La valeur la plus proche de 0</h2>
        <% int valeurPlusProcheZero = tableauEntiers[0];
           for (int valeur : tableauEntiers) {
               if (Math.abs(valeur) < Math.abs(valeurPlusProcheZero)) {
                   valeurPlusProcheZero = valeur;
               }
           }
        %>
        <p>La valeur la plus proche de 0 est : <%= valeurPlusProcheZero %></p>

        <h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
        <% int valeurPositifProcheZero = Integer.MAX_VALUE;
           int valeurNegatifProcheZero = Integer.MIN_VALUE;
           for (int valeur : tableauEntiers) {
               if (valeur >= 0 && valeur < valeurPositifProcheZero) {
                   valeurPositifProcheZero = valeur;
               }
               if (valeur < 0 && valeur > valeurNegatifProcheZero) {
                   valeurNegatifProcheZero = valeur;
               }
           }
           int valeurLaPlusProcheZero = (Math.abs(valeurNegatifProcheZero) < valeurPositifProcheZero) ? valeurNegatifProcheZero : valeurPositifProcheZero;
        %>
        <p>La valeur la plus proche de 0 (en cas d'égalité, chiffre positif) est : <%= valeurLaPlusProcheZero %></p>

    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
