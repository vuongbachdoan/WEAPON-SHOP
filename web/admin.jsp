<%-- 
    Document   : user
    Created on : May 29, 2023, 4:44:12 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page import="java.util.List"%>
<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style>
            #profile-actions {
                display: none;
            }
            #profile:hover #profile-actions {
                display: block;
            }
        </style>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body class="bg-slate-800">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || "US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <!--NAVBAR-->
        <nav class="relative bg-slate-950 shadow dark:bg-gray-800">
            <div class="container px-6 py-4 mx-auto md:flex md:justify-between md:items-center">
                <div class="flex items-center justify-between">
                    <a href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6 fill-stone-400">
                        <path fill-rule="evenodd" d="M8.478 1.6a.75.75 0 01.273 1.025 3.72 3.72 0 00-.425 1.122c.058.057.118.114.18.168A4.491 4.491 0 0112 2.25c1.413 0 2.673.651 3.497 1.668.06-.054.12-.11.178-.167a3.717 3.717 0 00-.426-1.126.75.75 0 111.298-.75 5.22 5.22 0 01.671 2.045.75.75 0 01-.187.582c-.241.27-.505.52-.787.749a4.495 4.495 0 01.216 2.1c-.106.792-.753 1.295-1.417 1.403-.182.03-.364.057-.547.081.152.227.273.476.359.741a23.122 23.122 0 003.832-.802 23.241 23.241 0 00-.345-2.634.75.75 0 011.474-.28c.21 1.115.348 2.256.404 3.418a.75.75 0 01-.516.749c-1.527.5-3.119.855-4.76 1.05-.074.38-.22.735-.423 1.05a24.61 24.61 0 015.943 1.358.75.75 0 01.492.75 24.665 24.665 0 01-1.189 6.25.75.75 0 01-1.425-.47 23.141 23.141 0 001.077-5.307c-.5-.168-1.009-.32-1.524-.454.068.234.104.484.104.746 0 3.956-2.521 7.5-6 7.5-3.478 0-6-3.544-6-7.5 0-.262.037-.511.104-.746-.514.134-1.022.286-1.522.454a23.14 23.14 0 001.077 5.308.75.75 0 01-1.425.468 24.663 24.663 0 01-1.19-6.25.75.75 0 01.493-.749 24.593 24.593 0 014.964-1.24h.01c.321-.046.644-.085.969-.118a2.982 2.982 0 01-.424-1.05 24.614 24.614 0 01-4.76-1.05.75.75 0 01-.516-.75c.057-1.161.194-2.302.405-3.417a.75.75 0 011.474.28c-.164.862-.28 1.74-.345 2.634 1.237.37 2.517.641 3.832.802.085-.265.207-.514.359-.74a18.732 18.732 0 01-.547-.082c-.664-.108-1.311-.611-1.417-1.403a4.535 4.535 0 01.217-2.103 6.788 6.788 0 01-.788-.751.75.75 0 01-.187-.583 5.22 5.22 0 01.67-2.04.75.75 0 011.026-.273z" clip-rule="evenodd" />
                        </svg>
                    </a>

                    <!-- Mobile menu button -->
                    <div class="flex lg:hidden">
                        <button type="button" class="text-gray-500 dark:text-cyan-500 hover:text-gray-600 dark:hover:text-gray-400 focus:outline-none focus:text-gray-600 dark:focus:text-gray-400" aria-label="toggle menu">
                            <svg x-show="!isOpen" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4 8h16M4 16h16" />
                            </svg>

                            <svg x-show="isOpen" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
                <div class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out dark:bg-gray-800 md:mt-0 md:p-0 md:top-0 md:relative md:bg-transparent md:w-auto md:opacity-100 md:translate-x-0 md:flex md:items-center">
                    <div class="flex flex-col md:flex-row md:mx-6">
                        <a class="my-2 text-cyan-500 transition-colors duration-300 transform dark:text-gray-200 hover:text-cyan-300 dark:hover:text-blue-400 md:mx-4 md:my-0" href="admin.jsp">Home</a>
                        <a class="my-2 text-cyan-500 transition-colors duration-300 transform dark:text-gray-200 hover:text-cyan-300 dark:hover:text-blue-400 md:mx-4 md:my-0" href="MainController?action=ShoppingPage">Shop</a>
                    </div>

                    <div id="profile" class="flex justify-center md:block">
                        <div class="relative inline-block ">
                            <!-- Dropdown toggle button -->
                            <button class="z-10 flex items-center p-2 text-sm text-gray-600 bg-cyan-800 border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
                                <span class="mx-1 text-white">USER | <%= loginUser.getFullName()%></span>
                                <svg class="w-5 h-5 mx-1 text-white" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12 15.713L18.01 9.70299L16.597 8.28799L12 12.888L7.40399 8.28799L5.98999 9.70199L12 15.713Z" fill="currentColor"></path>
                                </svg>
                            </button>

                            <!-- Dropdown menu -->
                            <div
                                id="profile-actions"
                                x-transition:enter="transition ease-out duration-100"
                                x-transition:enter-start="opacity-0 scale-90"
                                x-transition:enter-end="opacity-100 scale-100"
                                x-transition:leave="transition ease-in duration-100"
                                x-transition:leave-start="opacity-100 scale-100"
                                x-transition:leave-end="opacity-0 scale-90"
                                class="absolute top-0 right-0 z-0 w-56 py-0 mt-0 overflow-hidden origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800"
                                >
                                <a href="#" class="flex items-center p-3 -mt-2 text-sm text-gray-600 transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
                                    <img class="flex-shrink-0 object-cover mx-1 rounded-full w-9 h-9" src="https://images.unsplash.com/photo-1523779917675-b6ed3a42a561?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8d29tYW4lMjBibHVlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=face&w=500&q=200" alt="jane avatar">
                                    <div class="mx-1">
                                        <h1 class="text-sm font-semibold text-gray-700 dark:text-gray-200"><%= loginUser.getFullName()%></h1>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">@<%= loginUser.getRoleID()%></p>
                                    </div>
                                </a>
                                <hr class="border-gray-200 dark:border-gray-700 ">
                                <a href="#" class="flex items-center p-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
                                    <svg class="w-5 h-5 mx-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M7 8C7 5.23858 9.23858 3 12 3C14.7614 3 17 5.23858 17 8C17 10.7614 14.7614 13 12 13C9.23858 13 7 10.7614 7 8ZM12 11C13.6569 11 15 9.65685 15 8C15 6.34315 13.6569 5 12 5C10.3431 5 9 6.34315 9 8C9 9.65685 10.3431 11 12 11Z" fill="currentColor"></path>
                                    <path d="M6.34315 16.3431C4.84285 17.8434 4 19.8783 4 22H6C6 20.4087 6.63214 18.8826 7.75736 17.7574C8.88258 16.6321 10.4087 16 12 16C13.5913 16 15.1174 16.6321 16.2426 17.7574C17.3679 18.8826 18 20.4087 18 22H20C20 19.8783 19.1571 17.8434 17.6569 16.3431C16.1566 14.8429 14.1217 14 12 14C9.87827 14 7.84344 14.8429 6.34315 16.3431Z" fill="currentColor"></path>
                                    </svg>

                                    <span class="mx-1">
                                        view profile
                                    </span>
                                </a>
                                <hr class="border-gray-200 dark:border-gray-700 ">
                                <a href="#" class="flex items-center p-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
                                    <svg class="w-5 h-5 mx-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M19 21H10C8.89543 21 8 20.1046 8 19V15H10V19H19V5H10V9H8V5C8 3.89543 8.89543 3 10 3H19C20.1046 3 21 3.89543 21 5V19C21 20.1046 20.1046 21 19 21ZM12 16V13H3V11H12V8L17 12L12 16Z" fill="currentColor"></path>
                                    </svg>

                                    <span class="mx-1">
                                        Sign Out
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!--END NAVBAR-->                          

        <!--BANNER-->
        <section>
            <div class="max-w-3xl px-6 py-16 mx-auto text-center">
                <h1 class="text-3xl font-semibold text-white dark:text-gray-100">Wellcome "<%= loginUser.getFullName()%>"!</h1>
                <p class="max-w-md mx-auto mt-5 text-gray-500 dark:text-gray-400">Find your sugar babies or find your users, type name below and click search.</p>

                <form action="MainController" class="flex flex-col mt-8 space-y-3 sm:space-y-0 sm:flex-row sm:justify-center sm:-mx-2">
                    <input id="email" type="text" name="search" value="<%= search%>" class="px-4 py-2 bg-slate-900 text-gray-300 placeholder-gray-300 rounded-md sm:mx-2 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" placeholder="User name">

                    <button type="submit" name="action" value="Search" class="px-4 py-2 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-amber-600 rounded-md sm:mx-2 hover:bg-amber-500 focus:outline-none focus:bg-amber-600">
                        Search users
                    </button>
                </form>
            </div>
        </section>
        <!--END BANNER-->

        <!--TABLE USERS-->
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <div class="container flex justify-center pb-16">
            <table class="mx-6 xy-4 bg-slate-900 rounded overflow-hidden text-left text-sm">
                <thead class="font-regular">
                    <tr class="bg-cyan-800 text-white">
                        <th scope="col" class="px-6 py-4 font-light">No</th>
                        <th scope="col" class="px-6 py-4 font-light">User ID</th>
                        <th scope="col" class="px-6 py-4 font-light">Full Name</th>
                        <th scope="col" class="px-6 py-4 font-light">Role ID</th>
                        <th scope="col" class="px-6 py-4 font-light">Password</th>
                        <th scope="col" class="px-6 py-4 font-light">Update</th>
                        <th scope="col" class="px-6 py-4 font-light">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {
                    %>
                <form action="MainController">
                    <tr class="transition duration-300 ease-in-out hover:bg-cyan-950 text-white">
                        <td class="whitespace-nowrap px-6 py-4 font-medium text-center"><%= count++%></td>
                        <td class="whitespace-nowrap px-6 py-4 font-light"><%= user.getUserId()%></td>
                        <td class="whitespace-nowrap px-6 py-4 font-light">
                            <input class="bg-stone-950 px-2 py-2 rounded border-0 outline-0" type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                        </td>
                        <td class="whitespace-nowrap px-6 py-4 font-light">
                            <input class="bg-stone-950 px-2 py-2 rounded border-0 outline-0" type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                        </td>
                        <td class="whitespace-nowrap px-6 py-4 font-light text-center"><%= user.getPassword()%></td>
                        <td class="whitespace-nowrap px-6 py-4 font-light text-center">
                            <label>
                                <input style="display: none" type="submit" name="action" value="Update">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="my-0 mx-auto bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                </svg> 
                            </label>
                            <input type="hidden" name="userID" value="<%= user.getUserId()%>"/>
                            <input type="hidden" name="search" value="<%= search%>"/>
                        </td>
                        <td class="whitespace-nowrap px-6 py-4 font-medium text-center"">
                            <a class="link-delete" href="MainController?search=<%=search%>&action=Delete&userID=<%=user.getUserId()%>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="my-0 mx-auto bi bi-trash-fill" viewBox="0 0 16 16">
                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                </svg>
                            </a>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>
                </tbody>
            </table>

        </div>
        <!--END TABLE USERS-->

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <p class="text-center mb-16 text-amber-500"><%= error%></p>
        <%
                }
            }
        %>

    </body>
</html>
