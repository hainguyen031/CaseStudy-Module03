package controller;

import entity.User;
import service.ICustomerService;
import service.Impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserController", urlPatterns = "/user")
public class UserController extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                loginForm(request, response);
                break;
            case "register":
                registerForm(request, response);
                break;
            case "logout":
                request.getSession().removeAttribute("customerFind");
                request.getRequestDispatcher("user/login.jsp").forward(request, response);
                break;
        }
    }

    private void loginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
        dispatcher.forward(request, response);
    }

    private void registerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/register.jsp");
        dispatcher.forward(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        RequestDispatcher dispatcher;
        User customerFind = customerService.findCustomerByUsername(username);
        if (username.equals("admin") && password.equals("admin")) {
            request.setAttribute("message", customerFind.getUsername());
            response.sendRedirect("/admin");
        } else if (username.equals(customerFind.getUsername()) && password.equals(customerFind.getPassword())) {
            Cookie cookieUsername = new Cookie("cookieUsername", username);
            Cookie cookiePassword = new Cookie("cookiePassword", password);
            cookieUsername.setMaxAge(60*60*24);
            cookiePassword.setMaxAge(60*60*24);
            response.addCookie(cookieUsername);
            response.addCookie(cookiePassword);
//            request.setAttribute("message", customerFind.getUsername());
            request.getSession().setAttribute("customerFind", customerFind);
            response.sendRedirect("/customer");
        } else if (username.equals("") || password.equals("")) {
            dispatcher = request.getRequestDispatcher("user/login.jsp");
            request.setAttribute("message", "Wrong Username or Password! Please try again!");
            dispatcher.forward(request, response);
        } else {
            dispatcher = request.getRequestDispatcher("user/login.jsp");
            request.setAttribute("message", "Wrong Username or Password! Please try again!");
            dispatcher.forward(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String customerEmail = request.getParameter("email");
        String customerPhone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User customerFind = customerService.findCustomerByUsername(username);
        User customer = new User(username, password, customerEmail, customerPhone);
        if (customerFind != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/register.jsp");
            request.setAttribute("message", "Username already exists, please register again!");
            dispatcher.forward(request, response);
        } else {
            if (!customer.getUsername().equals("") && !customer.getPassword().equals("") && !customer.getPhone().equals("") && !customer.getEmail().equals("")) {
                customerService.registerNewCustomer(customer);
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
                request.setAttribute("message", "Register Successfully!");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/register.jsp");
                request.setAttribute("message", "Please register again!");
                dispatcher.forward(request, response);
            }

        }

    }
}
