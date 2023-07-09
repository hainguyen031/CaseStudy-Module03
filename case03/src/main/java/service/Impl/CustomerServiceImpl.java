package service.Impl;

import entity.User;
import repository.ConnectionConfig;
import service.ICustomerService;

import java.sql.*;

public class CustomerServiceImpl implements ICustomerService {
    private static final String FIND_CUSTOMER_BY_USERNAME = "{CALL findCustomerByUsername(?)}";
    private static final String ADD_NEW_CUSTOMER = "{CALL addNewCustomer(?,?,?,?,?,?)}";


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcPassword = "123456789";
            String jdbcUsername = "root";
            String jdbcURL = "jdbc:mysql://localhost:3306/case_module_03";
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public User findCustomerByUsername(String username) {
        User user = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(FIND_CUSTOMER_BY_USERNAME)) {
            callableStatement.setString(1, username);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt("id");
                String customerEmail = rs.getString("email");
                String customerPhone = rs.getString("phone");
                String customerAddress = rs.getString("address");
                String customerUsername = rs.getString("username");
                String customerPassword = rs.getString("password");
                user = new User(customerId, customerUsername, customerPassword, customerPhone, customerEmail, customerAddress);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void registerNewCustomer(User customer) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER)) {
            callableStatement.setInt(1, customer.getId());
            callableStatement.setString(2, customer.getUsername());
            callableStatement.setString(3, customer.getPassword());
            callableStatement.setString(4, customer.getPhone());
            callableStatement.setString(5, customer.getEmail());
            callableStatement.setString(6, customer.getAddress());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


}
