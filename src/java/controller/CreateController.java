/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDAO;
import model.UserDTO;
import model.UserError;

/**
 *
 * @author Nguyen Thi Thuy Dung
 */
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        UserError userError = new UserError();
        try {
            UserDAO dao = new UserDAO();
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            if (userID.length() < 2 || userID.length() > 10) {
                userError.setRoleIDError("*UserID length must between [2,10].");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                userError.setUserIDError("*UserID already existed.");
                checkValidation = false;
            }

            if (fullName.length() < 5 || fullName.length() > 35) {
                userError.setFullNameError("*Fullname must between [5,20].");
                checkValidation = false;
            }

            if (!("AD".equals(roleID) || "US".equals(roleID))) {
                userError.setRoleIDError("*RoleID valid is [AD/US].");
                checkValidation = false;
            }

            if (password.isEmpty() || password.length() < 8 || password.length() > 16) {
                userError.setPasswordError("*Password must between [8-16].");
                checkValidation = false;
            }

            if (!password.equals(confirm)) {
                userError.setConfirmError("*Confirm password does not match.");
                checkValidation = false;
            }

            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
                boolean checkInsert = dao.insert(user);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    userError.setError("Unknown Error!");
                    request.setAttribute("USER ERROR", userError);
                }
            } else {
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
                request.setAttribute("USER_INFOR", user);
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
