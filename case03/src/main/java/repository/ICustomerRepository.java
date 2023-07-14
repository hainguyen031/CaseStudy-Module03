package repository;

import entity.Booking;
import entity.User;

public interface ICustomerRepository {
    User findCustomerByUsername(String username);

    void registerNewCustomer(User customer);

    void addNewBooking(Booking booking);

}
