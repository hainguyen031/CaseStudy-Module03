package repository;

import entity.Car;

import java.sql.Date;
import java.util.List;

public interface ICarRepository {
    List<Car> findAll();

    Car selectCar(int carId);

    void addNewCar(Car car);

    Car searchCarById(int carId);

    void update(int carId, Car car);

    boolean delete(int carId);

    List<Car> searchCarByForm(int seat, String pickupLocation, Date rentailDate, Date returnDate);

    void updateCar(Car car);
}
