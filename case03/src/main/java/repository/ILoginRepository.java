package repository;

import entity.User;

public interface ILoginRepository {
    User checkLogin(String username, String password);
}
