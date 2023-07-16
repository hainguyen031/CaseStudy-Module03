package service.Impl;

import entity.Booking;
import repository.Impl.BookingRepositoryImpl;
import service.IBookingService;

import java.util.List;

public class BookingServiceImpl implements IBookingService {
    private static final BookingServiceImpl bookingServiceImpl = new BookingServiceImpl();
    private BookingServiceImpl() {}
    public static BookingServiceImpl getInstance() {
        return bookingServiceImpl;
    }


    @Override
    public List<Booking> findBookingByUserID(int userId) {
        return BookingRepositoryImpl.getInstance().findBookingByUserID(userId);
    }

    @Override
    public List<Booking> findAllBooking() {
        return BookingRepositoryImpl.getInstance().findAllBooking();
    }
}
