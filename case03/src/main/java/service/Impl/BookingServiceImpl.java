package service.Impl;

import service.IBookingService;

public class BookingServiceImpl implements IBookingService {
    private static final BookingServiceImpl bookingServiceImpl = new BookingServiceImpl();
    private BookingServiceImpl() {}
    public static BookingServiceImpl getInstance() {
        return bookingServiceImpl;
    }



}
