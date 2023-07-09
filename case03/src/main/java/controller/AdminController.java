package controller;

import entity.Car;
import repository.Impl.CarRepositoryImpl;
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
    private CarServiceImpl carService = new CarServiceImpl();

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
//            case "searchTypeByName":
//                searchBrandByName(request, response);
//                break;
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
                deleteBrand(request, response);
                break;
//            case "searchBrandByName":
//                searchBrandByName(request, response);
//                break;
            default:
                listCars(request, response);
                break;
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response) {
        List<Car> carList = carService.findAll();
        request.setAttribute("carList", carList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/listCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewCar(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/addNewCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCarForm(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("id"));
        Car car = carService.selectCar(carId);
        request.setAttribute("car", car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/editCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteCarForm(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("brandId"));
        Car car = carService.selectCar(carId);
        request.setAttribute("car", car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/deleteCar.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewCar(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("id"));
        String carBrand = request.getParameter("brand");
        String carModel = request.getParameter("model");
        int carSeat = Integer.parseInt(request.getParameter("seat"));
        int carRentalPrice = Integer.parseInt(request.getParameter("rentalPrice"));
        boolean carAvailable = Boolean.parseBoolean(request.getParameter("available"));
        String carDescribe = request.getParameter("describe");

        Car car = new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe);
        carService.addNewCar(car);
        RequestDispatcher dispatcher = request.getRequestDispatcher("car/addNewCar.jsp");
        request.setAttribute("message", "Add New Car Successfully!");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editCar(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("carId"));
        String carBrand = request.getParameter("brand");
        String brandModel = request.getParameter("model");
        int carSeat = Integer.parseInt(request.getParameter("seat"));
        int carRentalPrice = Integer.parseInt(request.getParameter("rentalPrice"));
        boolean carAvailable = Boolean.parseBoolean(request.getParameter("available"));
        String carDescribe = request.getParameter("describe");
        Car car = carService.searchCarById(carId);
        car.setId(carId);
        car.setBrand(carBrand);
        car.setModel(brandModel);
        car.setSeats(carSeat);
        car.setRentPrice(carRentalPrice);
        car.setAvailable(carAvailable);
        car.setDescribe(carDescribe);
        try {
            carService.update(carId, car);
            request.setAttribute("car ", car);
            request.setAttribute("message", "Brand information was updated!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("brand/editBrand.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteBrand(HttpServletRequest request, HttpServletResponse response) {
        int carId = Integer.parseInt(request.getParameter("carId"));
        try {
            carService.delete(carId);
            response.sendRedirect("/admin");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
