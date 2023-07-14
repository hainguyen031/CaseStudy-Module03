package service.Impl;

import entity.Car;
import repository.Impl.CarRepositoryImpl;
import service.ICarService;

import java.sql.*;
import java.util.List;

public class CarServiceImpl implements ICarService {
    private static final CarServiceImpl carServiceImpl = new CarServiceImpl();
    private CarServiceImpl() {}
    public static CarServiceImpl getInstance() {
        return carServiceImpl;
    }
    @Override
    public List<Car> findAll() {
        return CarRepositoryImpl.getInstance().findAll();
    }

    @Override
    public Car selectCar(int carId) {
        return CarRepositoryImpl.getInstance().selectCar(carId);
    }

    @Override
    public void addNewCar(Car car) {
        CarRepositoryImpl.getInstance().addNewCar(car);
    }

    @Override
    public Car searchCarById(int carId) {
        return CarRepositoryImpl.getInstance().searchCarById(carId);
    }

    @Override
    public void update(int carId, Car car) {
        CarRepositoryImpl.getInstance().update(carId, car);
    }

    @Override
    public boolean delete(int carId) {
        return CarRepositoryImpl.getInstance().delete(carId);
    }

    @Override
    public List<Car> searchCarByForm(int seat, String pickupLocation, Date rentailDate, Date returnDate) {
        return CarRepositoryImpl.getInstance().searchCarByForm(seat, pickupLocation, rentailDate, returnDate);
    }

    @Override
    public void updateCar(Car car) {
        CarRepositoryImpl.getInstance().updateCar(car);
    }
}
