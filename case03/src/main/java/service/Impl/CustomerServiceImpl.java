package service.Impl;

import entity.Booking;
import entity.User;
import repository.ConnectionConfig;
import repository.Impl.CustomerRepositoryImpl;
import service.ICustomerService;

import java.sql.*;

public class CustomerServiceImpl implements ICustomerService {

    @Override
    public User findCustomerByUsername(String username) {
        return CustomerRepositoryImpl.getInstance().findCustomerByUsername(username);
    }

    @Override
    public void registerNewCustomer(User customer) {
        CustomerRepositoryImpl.getInstance().registerNewCustomer(customer);
    }

    @Override
    public void addNewBooking(Booking booking) {
        CustomerRepositoryImpl.getInstance().addNewBooking(booking);
    }


}
