package service;

import entity.Booking;

import java.util.List;

public interface IBookingService {
    List<Booking> findBookingByUserID(int userId);

    List<Booking> findAllBooking();

}
