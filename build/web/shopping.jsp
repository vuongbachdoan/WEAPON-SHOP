<%-- 
    Document   : shopping
    Created on : Jun 16, 2023, 1:46:50 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weapon Page</title>
    </head>
    <body class="bg-slate-800">
        
        <h1>Enjoy your life with Mai Ha</h1>
        <form action="MainController" method="POST">
            <select name="cmbWeapon">
                <option value="T01-Rifle-2000">Rifle-2000$</option>
                <option value="T02-Short Gun-1000">Short Gun-1000$</option>
                <option value="T03-Long Gun-3000">Long Gun-3000$</option>
                <option value="T04-Knife-3000">Knife-500$</option>
            </select>
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="10">10</option>
            </select>
            <input type="submit" name="action" value="Add"/>          
            <input type="submit" name="action" value="View"/>
        </form>
        <%
            String message = (String) request.getAttribute("MESSAGE");
            if(message == null) message = "";
        %>
        <%= message %>
    </body>
</html>
