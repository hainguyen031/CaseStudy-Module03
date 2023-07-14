package repository.Impl;

import entity.Car;
import repository.ConnectionConfig;
import repository.ICarRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarRepositoryImpl implements ICarRepository {
    private static final CarRepositoryImpl carRepository = new CarRepositoryImpl();
    private CarRepositoryImpl() {}
    public static CarRepositoryImpl getInstance() {
        return carRepository;
    }

    private static final String SELECT_ALL_CAR_SQL = "{CALL selectAllCarSQL()}";
    private static final String SELECT_CAR_BY_ID = "{CALL searchCarById(?)}";
    private static final String ADD_NEW_CAR = "{CALL addNewCar(?,?,?,?,?,?,?,?)}";
    private static final String SEARCH_CAR_BY_ID = "{CALL searchCarById(?)}";
    private static final String UPDATE_CAR_BY_ID = "{CALL updateCarById(?,?,?,?)}";
    private static final String DELETE_CAR_BY_ID = "{CALL deleteCarById(?)}";
    private static final String SEARCH_CAR_BY_FORM = "{CALL searchCarByForm(?,?,?,?)}";

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
                int carRentalPrice = rs.getInt("rental_price");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                String carUrl = rs.getString("url");
                String carLocation = rs.getString("car_location");
                cars.add(new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe, carUrl, carLocation));
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
                int carRentalPrice = rs.getInt("rental_price");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                String carUrl = rs.getString("url");
                String carLocation = rs.getString("car_location");
                car = new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe, carUrl, carLocation);
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
            callableStatement.setString(1, car.getBrand());
            callableStatement.setString(2, car.getModel());
            callableStatement.setInt(3, car.getSeats());
            callableStatement.setInt(4, car.getRentPrice());
            callableStatement.setBoolean(5, car.getAvailable());
            callableStatement.setString(6, car.getDescribe());
            callableStatement.setString(7, car.getUrl());
            callableStatement.setString(8, car.getCarLocation());
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
                int carRentalPrice = rs.getInt("rental_price");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                String carUrl = rs.getString("url");
                String carLocation = rs.getString("car_location");
                car = new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe, carUrl, carLocation);
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
//            callableStatement.setBoolean(6, car.getAvailable());
            callableStatement.setString(6, car.getDescribe());
            callableStatement.setString(7, car.getUrl());
            callableStatement.setString(8, car.getCarLocation());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean delete(int carId) {
        boolean rowDeleted;
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE_CAR_BY_ID);
            statement.setInt(1, carId);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return rowDeleted;
    }

    @Override
    public List<Car> searchCarByForm(int seat, String pickupLocation, Date rentailDate, Date returnDate) {
        List<Car> cars = new ArrayList<>();
        Car car = null;
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_CAR_BY_FORM);
            callableStatement.setInt(1, seat);
            callableStatement.setString(2, pickupLocation);
            callableStatement.setDate(3, rentailDate);
            callableStatement.setDate(4, returnDate);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int carId = rs.getInt("id");
                String carBrand = rs.getString("brand");
                String carModel = rs.getString("model");
                int carSeat = rs.getInt("seat");
                int carRentalPrice = rs.getInt("rental_price");
                boolean carAvailable = rs.getBoolean("available");
                String carDescribe = rs.getString("describe");
                String carUrl = rs.getString("url");
                String carLocation = rs.getString("car_location");
                car = new Car(carId, carBrand, carModel, carSeat, carRentalPrice, carAvailable, carDescribe, carUrl, carLocation);
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    @Override
    public void updateCar(Car car) {
        try {
        CallableStatement callableStatement = connection.prepareCall(UPDATE_CAR_BY_ID);
        callableStatement.setInt(1, car.getId());
        callableStatement.setInt(2, car.getRentPrice());
        callableStatement.setString(3, car.getDescribe());
        callableStatement.setString(4, car.getUrl());
        callableStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
}
