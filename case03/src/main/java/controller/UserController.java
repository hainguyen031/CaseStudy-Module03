package controller;

import entity.User;
import service.ICustomerService;
import service.Impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserController", urlPatterns = "/user")
public class UserController extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerServiceImpl();
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
        }
    }

    private void loginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/login.jsp");
        dispatcher.forward(request, response);
    }

    private void registerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/register.jsp");
        dispatcher.forward(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RequestDispatcher dispatcher;
        User customerFind = customerService.findCustomerByUsername(username);
        if (username.equals("admin") && password.equals("admin")) {
            request.setAttribute("message", customerFind.getUsername());
            response.sendRedirect("/decks");
        } else if (username.equals(customerFind.getUsername()) && password.equals(customerFind.getPassword())) {
            request.setAttribute("message", customerFind.getUsername());
            response.sendRedirect("/home");
        } else if (username.equals("") || password.equals("")) {
            dispatcher = request.getRequestDispatcher("user/login.jsp");
            request.setAttribute("message", "Wrong Information! Please try again!");
            dispatcher.forward(request, response);
        } else {
            dispatcher = request.getRequestDispatcher("user/login.jsp");
            request.setAttribute("message", "Wrong Information! Please try again!");
            dispatcher.forward(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String customerEmail = request.getParameter("email");
        String customerPhone = request.getParameter("phone");
        String customerAddress = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User customer = new User(username, password, customerPhone, customerEmail, customerAddress);
        if (!customer.getUsername().equals("") && !customer.getPassword().equals("") && !customer.getPhone().equals("") && !customer.getEmail().equals("") && !customer.getAddress().equals("")) {
            customerService.registerNewCustomer(customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/register.jsp");
            request.setAttribute("message", "Register Successfully!");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/register.jsp");
            request.setAttribute("message", "Please input!");
            dispatcher.forward(request, response);
        }
    }
}
