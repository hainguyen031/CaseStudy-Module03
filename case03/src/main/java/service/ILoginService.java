package service;

import entity.User;

public interface ILoginService {
    User checkLogin(String username, String password);

}
