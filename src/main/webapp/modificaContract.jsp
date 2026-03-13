<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.JavaBean, java.sql.*" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<title>Modifică Contract</title>

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
    margin-bottom: 30px;
}
form, .select-container {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.08);
    width: 420px;
    margin-bottom: 25px;
}
input, select {
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
}
.success { color: green; font-weight: bold; }
.back-btn {
    padding: 12px 20px;
    border: 2px solid #0056b3;
    color: #0056b3;
    text-decoration: none;
    border-radius: 8px;
}
</style>
</head>

<body>

<h1>✏ Modifică contract</h1>

<%
JavaBean jb = new JavaBean();
jb.connect();
ResultSet rs = jb.vedeTabela("contract");
%>

<div class="select-container">
<form method="post">
<select name="id" required>
<option value="">-- Alege contractul --</option>
<% while(rs.next()) { %>
<option value="<%= rs.getInt("idcontract") %>">
Contract ID <%= rs.getInt("idcontract") %>
</option>
<% } %>
</select>
<button type="submit" name="select">Selectează</button>
</form>
</div>

<%
if (request.getParameter("select") != null) {
    int id = Integer.parseInt(request.getParameter("id"));
    ResultSet c = jb.intoarceLinie("contract","idcontract",id);
    if (c.next()) {
%>

<form method="post">
<input type="hidden" name="id" value="<%= id %>">

<input type="date" name="dataStart" value="<%= c.getDate("data_inceput") %>" required>
<input type="date" name="dataEnd" value="<%= c.getDate("data_sfarsit") %>" required>
<input type="text" name="status" value="<%= c.getString("status_contract") %>" required>

<button type="submit" name="update">Modifică contract</button>
</form>

<%
    }
}

if (request.getParameter("update") != null) {
    int id = Integer.parseInt(request.getParameter("id"));

    jb.modificaCamp("contract","data_inceput",request.getParameter("dataStart"),"idcontract",id);
    jb.modificaCamp("contract","data_sfarsit",request.getParameter("dataEnd"),"idcontract",id);
    jb.modificaCamp("contract","status_contract",request.getParameter("status"),"idcontract",id);

    out.println("<p class='success'>✔ Contract modificat cu succes!</p>");
}
%>

<a href="index.html" class="back-btn">⬅ Înapoi</a>

</body>
</html>
