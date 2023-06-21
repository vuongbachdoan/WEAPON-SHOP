<%-- 
    Document   : viewCart
    Created on : Jun 16, 2023, 2:02:32 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page import="shopping.Weapon"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
    </head>
    <body>
        <h1>Ban da them nhung vu khi nay!</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Edit</th>
                    <th>Remove</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    double total = 0;
                    for (Weapon weapon : cart.getCart().values()) {
                        total += weapon.getQuantity() * weapon.getPrice();
                %>
            <form>
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="id" value="<%=weapon.getId()%>" readonly=""/>
                    </td>
                    <td><%= weapon.getName()%></td>
                    <td><%= weapon.getPrice()%></td>
                    <td>
                        <input type="number" name="quantity" value="<%= weapon.getQuantity()%>" required=""/>
                    </td>
                    <th>
                        <input type="submit" name="action" value="Edit"/>
                    </th>
                    <th>
                        <input type="submit" name="action" value="Remove"/>
                    </th>
                    <td><%= weapon.getPrice() * weapon.getPrice()%></td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h1>Total: <%=total%></h1>
    <%
            }
        }
    %>
</body>
</html>
