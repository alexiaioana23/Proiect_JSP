<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.JavaBean" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<title>Adaugă Formație</title>

<style>
/* STIL IDENTIC – NU MODIFIC */
body {
    font-family: "Roboto", sans-serif;
    background: #f6f6f6;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0;
    padding: 30px;
    color: #333;
}
h1 {
    font-size: 28px;
    font-weight: 700;
    color: #0056b3;
    border-bottom: 3px solid #0056b3;
    padding-bottom: 8px;
    margin-bottom: 30px;
}
form {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.08);
    width: 400px;
}
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 2px solid #0056b3;
    border-radius: 8px;
}
button {
    width: 100%;
    padding: 12px;
    background: #0056b3;
    color: white;
    border: none;
    border-radius: 8px;
    margin-top: 10px;
}
.success { color: green; font-weight: bold; }
.error { color: red; font-weight: bold; }
.back-btn {
    margin-top: 20px;
    padding: 12px 20px;
    border: 2px solid #0056b3;
    border-radius: 8px;
    color: #0056b3;
    text-decoration: none;
}
</style>
</head>

<body>

<h1>➕ Adaugă membru</h1>

<%
if (request.getParameter("submit") != null) {
    try {
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        int varsta = Integer.parseInt(request.getParameter("varsta"));
        String instrument = request.getParameter("instrument");
        String nationalitate = request.getParameter("nationalitate");

        JavaBean jb = new JavaBean();
        jb.connect();
        jb.adaugaMembru(nume, prenume, varsta, instrument, nationalitate);

        out.println("<p class='success'>✔ Membru adăugat cu succes!</p>");
    } catch (Exception e) {
        out.println("<p class='error'>Eroare: " + e.getMessage() + "</p>");
    }
}
%>

<form method="post">
    <input type="text" name="nume" placeholder="Nume" required>
    <input type="text" name="prenume" placeholder="Prenume" required>
    <input type="number" name="varsta" placeholder="Vârstă" required>
    <input type="text" name="instrument" placeholder="Instrument" required>
    <input type="text" name="nationalitate" placeholder="Naționalitate" required>
    <button type="submit" name="submit">Adaugă membru</button>
</form>
<a class="back-btn" href="index.html">⬅ Înapoi la meniu</a>
</body>
</html>