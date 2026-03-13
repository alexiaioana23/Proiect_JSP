<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.JavaBean" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<title>Șterge contracte</title>

<style>
body {
    font-family: "Roboto", sans-serif;
    background: #f6f6f6;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 40px;
}

h1 {
    font-size: 28px;
    color: #0056b3;
    border-bottom: 3px solid #0056b3;
    padding-bottom: 8px;
    margin-bottom: 30px;
}

.container {
    width: 900px;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th {
    background: #0056b3;
    color: white;
    padding: 12px;
}

td {
    border-bottom: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

tr:hover {
    background: #e6f0ff;
}

button {
    padding: 12px 20px;
    background: white;
    border: 2px solid #0056b3;
    color: #0056b3;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #0056b3;
    color: white;
}

.back-btn {
    display: inline-block;
    margin-top: 15px;
    text-decoration: none;
    color: #0056b3;
    font-weight: bold;
}
</style>

</head>
<body>

<h1>🗑 Șterge contracte</h1>

<div class="container">

<form method="post">

<table>
<tr>
    <th>Select</th>
    <th>ID</th>
    <th>ID Formație</th>
    <th>ID Membru</th>
    <th>Data început</th>
    <th>Data sfârșit</th>
    <th>Status</th>
</tr>

<%
    JavaBean jb = new JavaBean();
    jb.connect();

    ResultSet rs = jb.vedeTabela("contract");

    while (rs.next()) {
%>
<tr>
    <td>
        <input type="checkbox" name="primarykey" value="<%= rs.getInt("idcontract") %>">
    </td>
    <td><%= rs.getInt("idcontract") %></td>
    <td><%= rs.getInt("idformatie") %></td>
    <td><%= rs.getInt("idmembru") %></td>
    <td><%= rs.getDate("data_inceput") %></td>
    <td><%= rs.getDate("data_sfarsit") %></td>
    <td><%= rs.getString("status_contract") %></td>
</tr>
<%
    }
%>

</table>

<button type="submit">Șterge contractele selectate</button>

</form>

<%
    if (request.getParameterValues("primarykey") != null) {
        String[] ids = request.getParameterValues("primarykey");
        jb.stergeDateTabela(ids, "contract", "idcontract");

        out.println("<p style='color:green; font-weight:bold;'>✔ Contracte șterse cu succes!</p>");
    }

    jb.disconnect();
%>

<a href="index.html" class="back-btn">⬅ Înapoi la meniu</a>

</div>

</body>
</html>
