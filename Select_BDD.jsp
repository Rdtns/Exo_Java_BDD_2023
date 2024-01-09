<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>

    <% 
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/films";
            String user = "mysql";
            String password = "mysql";
            Connection conn = DriverManager.getConnection(url, user, password);

            // Exemple de requête SQL
            String sql = "SELECT idFilm, titre, année FROM Film WHERE année BETWEEN 2000 AND 2015";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            // Afficher les résultats
            while (rs.next()) {
                int idFilm = rs.getInt("idFilm");
                String titre = rs.getString("titre");
                int annee = rs.getInt("année");
                
                out.println("ID : " + idFilm + ", Titre : " + titre + ", Année : " + annee + "<br>");
            }

            // Fermer les ressources 
            rs.close();
            pstmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>

    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <p>Extraire les films dont l'année est supérieure à 2000 et inférieure à 2015.</p>

    <h2>Exercice 2 : Année de recherche</h2>
    <form action="#" method="post">
        <label for="inputYear">Saisir une année :</label>
        <input type="text" id="inputYear" name="year">
        <input type="submit" value="Rechercher">
    </form>

    <% 
        String yearToSearch = request.getParameter("year");
        if (yearToSearch != null && !yearToSearch.isEmpty()) {
            try {
                int year = Integer.parseInt(yearToSearch);
                String searchSQL = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
                PreparedStatement searchStmt = conn.prepareStatement(searchSQL);
                searchStmt.setInt(1, year);
                ResultSet searchResult = searchStmt.executeQuery();

                out.println("<p>Résultats de la recherche pour l'année " + year + " :</p>");
                while (searchResult.next()) {
                    int idFilm = searchResult.getInt("idFilm");
                    String titre = searchResult.getString("titre");
                    int annee = searchResult.getInt("année");
                    out.println("ID : " + idFilm + ", Titre : " + titre + ", Année : " + annee + "<br>");
                }

                searchResult.close();
                searchStmt.close();
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <h2>Exercice 3 : Modification du titre du film</h2>
    <form action="#" method="post">
        <label for="inputFilmId">ID du film :</label>
        <input type="text" id="inputFilmId" name="filmId">
        <label for="inputNewTitle">Nouveau titre :</label>
        <input type="text" id="inputNewTitle" name="newTitle">
        <input type="submit" value="Modifier le titre">
    </form>

    <% 
        String filmIdToUpdate = request.getParameter("filmId");
        String newTitle = request.getParameter("newTitle");
        if (filmIdToUpdate != null && newTitle != null && !filmIdToUpdate.isEmpty() && !newTitle.isEmpty()) {
            try {
                int idToUpdate = Integer.parseInt(filmIdToUpdate);
                String updateSQL = "UPDATE Film SET titre = ? WHERE idFilm = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                updateStmt.setString(1, newTitle);
                updateStmt.setInt(2, idToUpdate);
                int rowsAffected = updateStmt.executeUpdate();

                out.println("<p>" + rowsAffected + " film(s) mis à jour avec le nouveau titre.</p>");
                
                updateStmt.close();
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <h2>Exercice 4 : Ajout d'un nouveau film</h2>
    <form action="#" method="post">
        <label for="inputNewFilmTitle">Titre du nouveau film :</label>
        <input type="text" id="inputNewFilmTitle" name="newFilmTitle">
        <label for="inputNewFilmYear">Année du nouveau film :</label>
        <input type="text" id="inputNewFilmYear" name="newFilmYear">
        <input type="submit" value="Ajouter le film">
    </form>

    <% 
        String newFilmTitle = request.getParameter("newFilmTitle");
        String newFilmYear = request.getParameter("newFilmYear");
        if (newFilmTitle != null && newFilmYear != null && !newFilmTitle.isEmpty() && !newFilmYear.isEmpty()) {
            try {
                int year = Integer.parseInt(newFilmYear);
                String insertSQL = "INSERT INTO Film (titre, année) VALUES (?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
                insertStmt.setString(1, newFilmTitle);
                insertStmt.setInt(2, year);
                int rowsInserted = insertStmt.executeUpdate();

                out.println("<p>" + rowsInserted + " nouveau(x) film(s) ajouté(s) à la base de données.</p>");
                
                insertStmt.close();
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</body>
</html>
