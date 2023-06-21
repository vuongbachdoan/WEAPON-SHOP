<%-- 
    Document   : create
    Created on : Jun 9, 2023, 1:19:59 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page import="model.UserDTO"%>
<%@page import="model.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                padding: 0px;
                margin: 0px;
            }
            html {
                font-family: sans-serif;
            }
            body {
                width: 100%;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background: #fafafa;
                flex-direction: column;
            }
            form {
                padding: 25px 12.5px;
                border: 0.5px solid #ccc;
                border-radius: 10px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                row-gap: 15px;
            }
            .btn-dark {
                background: #303030;
                /*                background: rgb(63,94,251);
                                background: linear-gradient(90deg, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);*/
                padding: 7px 15px;
                color: white;
                border-radius: 3.5px;
                border: 0px;
                outline: none;
                font-weight: 500;
                font-size: 14px;
                cursor: pointer;
                flex: 1;
            }
            .input-wrapper {
                display: flex;
                flex-direction: column;
                row-gap: 7.5px;
            }
            .input-field {
                min-width: 240px;
                padding: 7px 15px;
                border: 0px;
                background: #ccc;
                border-radius: 3.5px;
                color: #303030;
            }
            .heading {
                margin-bottom: 0px;
                text-align: center;
            }
            label {
                color: #ccc;
                font-size: 12px;
                font-weight: 300;
                display: flex;
                align-items: center;
                column-gap: 7.5px;
            }
            .btns-wrapper {
                display: flex;
                column-gap: 15px;
            }
            svg {
                width: 18px;
                height: 18px;
            }
            .text-warning {
                color: red;
                font-size: 12px;
            } 
            .link-register {
                font-size: 12px;
                color: #303030;
            }
        </style>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>

        <%
            UserDTO user = (UserDTO) request.getAttribute("USER_INFOR");
        %>
        <form action="MainController" method="POST" id="signUp">
            <h1 class="heading">Regist User</h1>

            <div class="input-wrapper">
                <label for="userId">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard-fill" viewBox="0 0 16 16">
                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
                    </svg>
                    UserID 
                </label>
                <input id="userId" class="input-field" type="text" name="userID" required value="<%= user.getUserId()%>"/>
                <p class="text-warning"><%= userError.getUserIDError()%></p>
            </div>

            <div class="input-wrapper">
                <label for="fullName">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
                    </svg>                    
                    fullName 
                </label>
                <input id="userId" class="input-field" type="text" name="fullName" required value="<%= user.getFullName()%>"/>
                <p class="text-warning"><%= userError.getFullNameError()%></p>
            </div>

            <div class="input-wrapper">
                <label for="roleID">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16">
                    <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/>
                    </svg>                   
                    RoleID 
                </label>
                <input id="roleID" class="input-field" type="text" name="roleID" required value="<%= user.getRoleID()%>"/>
                <p class="text-warning"><%= userError.getRoleIDError()%></p>
            </div>

            <div class="input-wrapper">
                <label for="password">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
                    <path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                    </svg>
                    Password 
                </label>
                <input id="password" class="input-field" type="password" name="password" required value="<%= user.getPassword()%>"/> 
                <p class="text-warning"><%= userError.getPasswordError()%></p>
            </div>

            <div class="input-wrapper">
                <label for="password">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
                    <path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                    </svg>
                    Confirm Password 
                </label>
                <input id="confirm" class="input-field" type="password" name="confirm" required/> 
                <p class="text-warning"><%= userError.getConfirmError()%></p>
            </div>

            <div class="btns-wrapper">
                <input class="btn-dark" type="submit" name="action" value="Create"/>
                <input class="btn-dark" type="reset" value="Reset"/>
            </div>

        </form>
        <a class="link-register" href="login.html">Have an account, back to Login.</a>
    </body>
</body>
</html>
