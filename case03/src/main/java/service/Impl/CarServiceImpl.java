package service.Impl;

import entity.Car;
import repository.ConnectionConfig;
import service.ICarService;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarServiceImpl implements ICarService {
    private static final String SELECT_ALL_CAR_SQL = "{CALL selectAllCarSQL()}";
    private static final String SELECT_CAR_BY_ID = "{CALL searchCarById(?)}";
    private static final String ADD_NEW_CAR = "{CALL addNewCar(?,?,?)}";
    private static final String SEARCH_CAR_BY_ID = "{CALL searchCarById(?)}";
    private static final String UPDATE_CAR_BY_ID = "{CALL updateCarById(?,?,?)}";
    private static final String DELETE_CAR_BY_ID = "{CALL deleteCarById(?)}";

    Connection connection = ConnectionConfig.getConnection();
    @Override
    public List<Car> findAll() {
        List<Car> cars = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CAR_SQL);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int carId = rs.getInt("id");
                String carBrand = rs.getString("brand");
                String carModel = rs.getString("model");
                int carSeat = rs.getInt("seat");
                int carRentalPrice = rs.getInt("rentalPrice");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                cars.add(new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    @Override
    public Car selectCar(int carId) {
        Car car = null;
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_CAR_BY_ID);
            callableStatement.setString(1, String.valueOf(carId));
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String carBrand = rs.getString("brand");
                String carModel = rs.getString("model");
                int carSeat = rs.getInt("seat");
                int carRentalPrice = rs.getInt("rentalPrice");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                car = new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    @Override
    public void addNewCar(Car car) {
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CAR);
            callableStatement.setInt(1, car.getId());
            callableStatement.setString(2, car.getBrand());
            callableStatement.setString(3, car.getModel());
            callableStatement.setInt(3, car.getSeats());
            callableStatement.setInt(3, car.getRentPrice());
            callableStatement.setBoolean(3, car.getAvailable());
            callableStatement.setString(3, car.getDescribe());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Car searchCarById(int carId) {
        Car car = null;
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_CAR_BY_ID);
            callableStatement.setInt(1, carId);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String carBrand = rs.getString("brand");
                String carModel = rs.getString("model");
                int carSeat = rs.getInt("seat");
                int carRentalPrice = rs.getInt("rentalPrice");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                car = new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    @Override
    public void update(int carId, Car car) {
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_CAR_BY_ID);
            callableStatement.setInt(1, car.getId());
            callableStatement.setString(2, car.getBrand());
            callableStatement.setString(3, car.getModel());
            callableStatement.setInt(4, car.getSeats());
            callableStatement.setInt(5, car.getRentPrice());
            callableStatement.setBoolean(6, car.getAvailable());
            callableStatement.setString(7, car.getDescribe());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int carId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CAR_BY_ID);
            callableStatement.setInt(1, carId);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
