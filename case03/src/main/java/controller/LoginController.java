//package controller;
//
//import entity.User;
//import service.ILoginService;
//import service.Impl.LoginServiceImpl;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(name = "LoginController", urlPatterns = "/login")
//public class LoginController extends HttpServlet {
//    private ILoginService iLoginService = new LoginServiceImpl();
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        login(request, response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        request.getRequestDispatcher("login.jsp").forward(request, response);
//
//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "logout":
//                request.getSession().removeAttribute("usernameSession");
//                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
//                break;
//            case "login":
//            default:
//                goLogin(request, response);
//        }
//    }
//
//    private void loginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("common/login.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void registerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("common/register.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        RequestDispatcher dispatcher;
//        User customerFind = customerService.findCustomerByUsername(username);
//        if (username.equals("admin") && password.equals("admin")) {
//            request.setAttribute("message", customerFind.getCustomerName());
//            response.sendRedirect("/decks");
//        } else if (username.equals(customerFind.getUsername()) && password.equals(customerFind.getPassword())) {
//            request.setAttribute("message", customerFind.getCustomerName());
//            response.sendRedirect("/home");
//        } else if (username.equals("") || password.equals("")) {
//            dispatcher = request.getRequestDispatcher("customer/login.jsp");
//            request.setAttribute("message", "Wrong Information! Please try agian!");
//            dispatcher.forward(request, response);
//        } else {
//            dispatcher = request.getRequestDispatcher("customer/login.jsp");
//            request.setAttribute("message", "Wrong Information! Please try agian!");
//            dispatcher.forward(request, response);
//        }
//    }
//    private void login(HttpServletRequest request, HttpServletResponse response) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String rememberMe = request.getParameter("rememberMe");
//
//        User user = iLoginService.checkLogin(username, password);
//
//        if (user != null) {
//            try {
//                if (rememberMe != null) {
//                    if (rememberMe.equals("on")) {
//                        Cookie cookieUsername = new Cookie("cookieUsername", username);
//                        Cookie cookiePassword = new Cookie("cookiePassword", password);
//                        response.addCookie(cookieUsername);
//                        response.addCookie(cookiePassword);
//                    }
//                }
//                request.getSession().setAttribute("usernameSession", user.getUsername());
////                request.getSession().setAttribute("roleSession", user.getRole());
//                response.sendRedirect("/common/homePage.jsp");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        } else {
//            try {
//                request.setAttribute("message", "Username or password wrong, try again !!!");
//                request.setAttribute("username", username);
//                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//    private void goLogin(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            Cookie[] cookies = request.getCookies();
//            if (cookies != null) {
//                for (Cookie cookie : cookies) {
//                    if (cookie.getName().equals("cookieUsername")) {
//                        request.setAttribute("username", cookie.getValue());
//                    }
//                    if (cookie.getName().equals("cookiePassword")) {
//                        request.setAttribute("password", cookie.getValue());
//                    }
//                }
//            }
//            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }
//}
