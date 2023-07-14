package controller;

import entity.Booking;
import entity.Car;
import entity.User;
import repository.Impl.CustomerRepositoryImpl;
import service.Impl.CarServiceImpl;
import service.Impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = "/customer")
public class CustomerController extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "searchCar":
                searchCarFrom(request, response);
                break;
//            case "sortCar":
////                sortCarForm(request, response);
//                break;
//            case "deleteCar":
//                showDeleteCarForm(request, response);
//                break;
//            case "searchTypeByName":
//                searchBrandByName(request, response);
//                break;
            default:
                listCars(request, response);
                break;
        }
    }

    private void searchCarFrom(HttpServletRequest request, HttpServletResponse response) {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
//        String usernameLogin = request.getParameter("message");
//        User userLogin = CustomerRepositoryImpl.getInstance().findCustomerByUsername(usernameLogin);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "searchCar":
                searchCar(request, response);
                break;
//            case "sortCar":
//                sortCar(request, response);
//                break;
//            case "bookingCar":
//                bookingCar(request, response);
//                break;
            case "rentCar":
                rentCar(request, response);
                break;
            default:
                listCars(request, response);
                break;
        }
    }

    private void rentCar(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("customerFind");
        int userId = user.getId();
        int carId = Integer.parseInt(request.getParameter("carId"));
        String cccd = request.getParameter("cccd1");
        String gplx = request.getParameter("gplx1");
        String pickupLocation = request.getParameter("pickupLocation1");
        String rentalDateStr = request.getParameter("startDate");
        String returnDateStr = request.getParameter("endDate");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate rentailDate = LocalDate.parse(rentalDateStr, formatter);
        LocalDate returnDate = LocalDate.parse(returnDateStr, formatter);

        Booking booking = new Booking(userId, carId, rentailDate, returnDate, cccd, gplx, pickupLocation);
        customerService.addNewBooking(booking);
        request.setAttribute("successMessage", "Book car successful");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("car/listCar.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            throw new RuntimeException(e);
//        }

    }

//    private void bookingCar(HttpServletRequest request, HttpServletResponse response) {
//        int carId = Integer.parseInt(request.getParameter("carId"));
//        Car car = CarServiceImpl.getInstance().searchCarById(carId);
//        request.setAttribute("car", car);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("booking/booking.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
//
//    }

    private void searchCar(HttpServletRequest request, HttpServletResponse response) {
        int seat = Integer.parseInt(request.getParameter("carType"));
        String pickupLocation = request.getParameter("carLocation");
        String rentalDateStr = request.getParameter("pick-up-date");
        String returnDateStr = request.getParameter("return-date");
        // Xử lý chuyển đổi chuỗi thành ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/M/d");
        LocalDate rentailDate = LocalDate.parse(rentalDateStr, formatter);
        LocalDate returnDate = LocalDate.parse(returnDateStr, formatter);
//        Date rentailDate = null;
//        Date returnDate = null;
//        try {
//            rentailDate = dateFormat.parse(rentalDateStr);
//            returnDate = dateFormat.parse(returnDateStr);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        List<Car> carList = CarServiceImpl.getInstance().searchCarByForm(seat, pickupLocation,
                Date.valueOf(rentailDate), Date.valueOf(returnDate));
        request.setAttribute("carList", carList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/listCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response) {
        List<Car> carList = CarServiceImpl.getInstance().findAll();
        request.setAttribute("carList", carList);
        User user = (User) request.getSession().getAttribute("customerFind");
//        System.out.println(user.getUsername());
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/listCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }



}
