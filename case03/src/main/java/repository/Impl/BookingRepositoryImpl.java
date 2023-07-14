package repository.Impl;

import repository.IBookingRepository;

public class BookingRepositoryImpl implements IBookingRepository {
    private static final BookingRepositoryImpl bookingRepositoryImpl = new BookingRepositoryImpl();
    private BookingRepositoryImpl() {}
    public static BookingRepositoryImpl getInstance() {
        return bookingRepositoryImpl;
    }



}
