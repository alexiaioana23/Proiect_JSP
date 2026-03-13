<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.JavaBean" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<title>Vizualizare Membri</title>

<style>
body {
    font-family: "Roboto", sans-serif;
    background: #f6f6f6;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
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
    width: fit-content;
    margin-bottom: 30px;
}
.table-container {
    width: 90%;
    max-width: 900px;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.08);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
th {
    background-color: #0056b3;
    color: white;
    padding: 12px;
}
td {
    border-bottom: 1px solid #ddd;
    padding: 10px;
}
tr:hover {
    background: #e6f0ff;
}
.back-btn {
    margin-top: 25px;
    padding: 12px 20px;
    border: 2px solid #0056b3;
    border-radius: 8px;
    color: #0056b3;
    text-decoration: none;
}
.back-btn:hover {
    background: #0056b3;
    color: white;
}
</style>
</head>

<body>

<h1>👤 Lista Membrilor</h1>

<div class="table-container">

<%
    JavaBean jb = new JavaBean();
    ResultSet rs = null;

    jb.connect();
    rs = jb.vedeTabela("membri");
%>

<table>
<tr>
    <th>ID</th>
    <th>Nume</th>
    <th>Prenume</th>
    <th>Vârstă</th>
    <th>Instrument</th>
    <th>Naționalitate</th>
</tr>

<%
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("idmembru") %></td>
    <td><%= rs.getString("nume") %></td>
    <td><%= rs.getString("prenume") %></td>
    <td><%= rs.getInt("varsta") %></td>
    <td><%= rs.getString("instrument") %></td>
    <td><%= rs.getString("nationalitate") %></td>
</tr>
<%
    }
%>

</table>
</div>

<a class="back-btn" href="index.html">⬅ Înapoi</a>

</body>
</html>
