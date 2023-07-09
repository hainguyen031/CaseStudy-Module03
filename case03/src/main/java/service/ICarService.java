package service;

import entity.Car;

import java.util.List;

public interface ICarService {
    List<Car> findAll();

    Car selectCar(int carId);

    void addNewCar(Car car);

    Car searchCarById(int carId);

    void update(int carId, Car car);

    void delete(int carId);
}
