package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import com.mvc.dao.UserDao;
import com.mvc.model.User;
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/userform.jsp";
    private static String LIST_USER = "/userlist.jsp";
    private UserDao dao;
    
    
    public UserController() {
      super();
      dao = new UserDao();
    }

	
	protected void doGet(HttpServletRequest request, 
	HttpServletResponse response) throws ServletException, 
	IOException {
		String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            dao.deleteUser(userId);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listUser")) {
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, 
	HttpServletResponse response) throws ServletException, 
	IOException {
        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setCountry(request.getParameter("country"));
        String userId = request.getParameter("userId");

        if (userId == null || userId.isEmpty()) {
            dao.addUser(user);
        } else {
            user.setId(Integer.parseInt(userId));
            dao.updateUser(user);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.getAllUsers());
        view.forward(request, response);
    }
}



