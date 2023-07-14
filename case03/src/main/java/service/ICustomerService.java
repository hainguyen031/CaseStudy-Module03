package service;

import entity.Booking;
import entity.User;

public interface ICustomerService {
    User findCustomerByUsername(String username);

    void registerNewCustomer(User customer);

    void addNewBooking(Booking booking);

}
