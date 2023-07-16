package controller;

import entity.Booking;
import entity.Car;
import repository.Impl.CarRepositoryImpl;
import service.Impl.BookingServiceImpl;
import service.Impl.CarServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addNewCar":
                showAddNewCar(request, response);
                break;
            case "editCar":
                showEditCarForm(request, response);
                break;
            case "deleteCar":
                showDeleteCarForm(request, response);
                break;
            case "listBooking":
                listBooking(request, response);
                break;
            default:
                listCars(request, response);
                break;
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addNewCar":
                addNewCar(request, response);
                break;
            case "editCar":
                editCar(request, response);
                break;
            case "deleteCar":
                deleteCar(request, response);
                break;
            case "listBooking":
                listBooking(request, response);
                break;
            default:
                listCars(request, response);
                break;
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response) {
        List<Car> carList = CarServiceImpl.getInstance().findAll();
        request.setAttribute("carList", carList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/viewAdmin.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void listBooking(HttpServletRequest request, HttpServletResponse response) {
        List<Booking> bookingList = BookingServiceImpl.getInstance().findAllBooking();
        request.setAttribute("bookingList", bookingList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/allBooking.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewCar(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/addNewCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCarForm(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("id"));
        Car car = CarServiceImpl.getInstance().selectCar(carId);
        request.setAttribute("car", car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/editCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteCarForm(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("id"));
        Car car = CarServiceImpl.getInstance().selectCar(carId);
        request.setAttribute("car", car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/deleteCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewCar(HttpServletRequest request, HttpServletResponse response) {
        String carBrand = request.getParameter("brand");
        String carModel = request.getParameter("model");
        int carSeat = Integer.parseInt(request.getParameter("seat"));
        int carRentalPrice = Integer.parseInt(request.getParameter("price"));
        boolean carAvailable = Boolean.parseBoolean(request.getParameter("available"));
        String carDescribe = request.getParameter("describe");
        String carURL = request.getParameter("url");
        String carURL2 = request.getParameter("url2");
        String carURL3 = request.getParameter("url3");
        String carURL4 = request.getParameter("url4");
        String carLocation = request.getParameter("location");

        Car car = new Car(carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe, carURL, carURL2, carURL3, carURL4, carLocation);
        CarServiceImpl.getInstance().addNewCar(car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/addNewCar.jsp");
        request.setAttribute("message", "Add New Car Successfully!");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int rentPrice = Integer.parseInt(request.getParameter("rentPrice"));
        String describe = request.getParameter("describe");
        String url = request.getParameter("url");
        String url2 = request.getParameter("url2");
        String url3 = request.getParameter("url3");
        String url4 = request.getParameter("url4");
        Car car = new Car(id, rentPrice, describe, url, url2, url3, url4);
        CarServiceImpl.getInstance().updateCar(car);
        listCars(request, response);
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("id"));
        CarServiceImpl.getInstance().delete(carId);
        List<Car> carList = CarServiceImpl.getInstance().findAll();
        listCars(request, response);
    }


}
