<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.JavaBean, java.sql.*" %>

<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<title>Modifică Formație</title>

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
.error { color: red; font-weight: bold; }
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

<h1>✏ Modifică formație</h1>

<%
JavaBean jb = new JavaBean();
jb.connect();
ResultSet rs = jb.vedeTabela("formatii");
%>

<div class="select-container">
<form method="post">
<select name="id">
<option value="">-- Alege formația --</option>
<% while(rs.next()) { %>
<option value="<%= rs.getInt("idformatie") %>">
<%= rs.getString("nume") %>
</option>
<% } %>
</select>
<button type="submit" name="select">Selectează</button>
</form>
</div>

<%
if (request.getParameter("select") != null) {
    int id = Integer.parseInt(request.getParameter("id"));
    ResultSet f = jb.intoarceLinie("formatii","idformatie",id);
    if (f.next()) {
%>

<form method="post">
<input type="hidden" name="id" value="<%= id %>">
<input type="text" name="nume" value="<%= f.getString("nume") %>" required>
<input type="text" name="gen" value="<%= f.getString("gen_muzical") %>" required>
<input type="number" name="an" value="<%= f.getInt("an_infiintare") %>" required>
<input type="text" name="tara" value="<%= f.getString("tara_origine") %>" required>
<button type="submit" name="update">Modifică</button>
</form>

<%
    }
}

if (request.getParameter("update") != null) {
    jb.modificaCamp("formatii","nume",request.getParameter("nume"),"idformatie",Integer.parseInt(request.getParameter("id")));
    jb.modificaCamp("formatii","gen_muzical",request.getParameter("gen"),"idformatie",Integer.parseInt(request.getParameter("id")));
    jb.modificaCamp("formatii","an_infiintare",request.getParameter("an"),"idformatie",Integer.parseInt(request.getParameter("id")));
    jb.modificaCamp("formatii","tara_origine",request.getParameter("tara"),"idformatie",Integer.parseInt(request.getParameter("id")));
    out.println("<p class='success'>✔ Formație modificată!</p>");
}
%>

<a href="index.html" class="back-btn">⬅ Înapoi</a>
</body>
</html>
