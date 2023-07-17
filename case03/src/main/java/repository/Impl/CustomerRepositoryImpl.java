package repository.Impl;

import entity.Booking;
import entity.User;
import repository.ConnectionConfig;
import repository.ICustomerRepository;

import java.sql.*;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private static final CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();

    private CustomerRepositoryImpl() {
    }

    public static CustomerRepositoryImpl getInstance() {
        return customerRepository;
    }

    private static final String FIND_CUSTOMER_BY_USERNAME = "{CALL findCustomerByUsername(?)}";
    private static final String ADD_NEW_CUSTOMER = "{CALL addNewCustomer(?,?,?,?)}";
    private static final String ADD_NEW_BOOKING = "{CALL addNewBooking(?,?,?,?,?,?,?)}";

    Connection connection = ConnectionConfig.getConnection();

    @Override
    public User findCustomerByUsername(String username) {
        User user = null;
        try (
                CallableStatement callableStatement = connection.prepareCall(FIND_CUSTOMER_BY_USERNAME)) {
            callableStatement.setString(1, username);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt("id");
                String customerEmail = rs.getString("email");
                String customerPhone = rs.getString("phone");
                String customerUsername = rs.getString("username");
                String customerPassword = rs.getString("password");
                user = new User(customerId, customerUsername, customerPassword, customerPhone, customerEmail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void registerNewCustomer(User customer) {
        try (
                CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER)) {
            callableStatement.setString(1, customer.getUsername());
            callableStatement.setString(2, customer.getPassword());
            callableStatement.setString(3, customer.getEmail());
            callableStatement.setString(4, customer.getPhone());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addNewBooking(Booking booking) {
        try (
                CallableStatement callableStatement = connection.prepareCall(ADD_NEW_BOOKING)) {
            callableStatement.setInt(1, booking.getCustomerId());
            callableStatement.setInt(2, booking.getCarId());
            callableStatement.setDate(3, Date.valueOf(booking.getStartDate()));
            callableStatement.setDate(4, Date.valueOf(booking.getEndDate()));
            callableStatement.setString(5, booking.getCccd());
            callableStatement.setString(6, booking.getGplx());
            callableStatement.setString(7, booking.getPickupLocation());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}