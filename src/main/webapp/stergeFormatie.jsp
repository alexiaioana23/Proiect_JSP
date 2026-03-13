<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.JavaBean" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<title>Șterge Formații</title>

<style>
body {
    font-family: "Roboto", sans-serif;
    background: #f6f6f6;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 30px;
}
h1 {
    font-size: 28px;
    color: #0056b3;
    border-bottom: 3px solid #0056b3;
    padding-bottom: 8px;
}
.container {
    width: 700px;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.1);
}
table {
    width: 100%;
    border-collapse: collapse;
}
th {
    background: #0056b3;
    color: white;
    padding: 10px;
}
td {
    border-bottom: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}
button {
    margin-top: 20px;
    padding: 12px 20px;
    border: 2px solid #0056b3;
    background: white;
    color: #0056b3;
    border-radius: 8px;
    cursor: pointer;
}
button:hover {
    background: #0056b3;
    color: white;
}
.back-btn {
    margin-top: 20px;
    text-decoration: none;
    color: #0056b3;
    font-weight: bold;
}
</style>
</head>

<body>

<h1>🗑 Șterge formații</h1>

<div class="container">

<form method="post">
<table>
<tr>
    <th>Select</th>
    <th>ID</th>
    <th>Nume</th>
    <th>Gen muzical</th>
    <th>Țara</th>
</tr>

<%
    JavaBean jb = new JavaBean();
    jb.connect();
    ResultSet rs = jb.vedeTabela("formatii");

    while (rs.next()) {
%>
<tr>
    <td><input type="checkbox" name="primarykey" value="<%= rs.getInt("idformatie") %>"></td>
    <td><%= rs.getInt("idformatie") %></td>
    <td><%= rs.getString("nume") %></td>
    <td><%= rs.getString("gen_muzical") %></td>
    <td><%= rs.getString("tara_origine") %></td>
</tr>
<%
    }
%>
</table>

<button type="submit">Șterge formațiile selectate</button>
</form>

<%
    if (request.getParameterValues("primarykey") != null) {
        jb.stergeDateTabela(
            request.getParameterValues("primarykey"),
            "formatii",
            "idformatie"
        );
        out.println("<p style='color:green;font-weight:bold;'>✔ Formații șterse cu succes!</p>");
    }
    jb.disconnect();
%>

<a href="index.html" class="back-btn">⬅ Înapoi la meniu</a>
</div>

</body>
</html>
