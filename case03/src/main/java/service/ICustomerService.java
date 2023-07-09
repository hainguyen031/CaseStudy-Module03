package service;

import entity.User;

public interface ICustomerService {
    User findCustomerByUsername(String username);

    void registerNewCustomer(User customer);
}
