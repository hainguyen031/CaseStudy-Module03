package repository;

import entity.Booking;

import java.util.List;

public interface IBookingRepository {
    List<Booking> findBookingByUserID(int userId);
}
