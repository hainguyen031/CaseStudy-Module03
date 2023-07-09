package service.Impl;

import entity.User;
import repository.ILoginRepository;
import repository.Impl.LoginRepositoryImpl;
import service.ILoginService;

public class LoginServiceImpl implements ILoginService {
//    private ILoginRepository iLoginRepository = new LoginRepositoryImpl();

    @Override
    public User checkLogin(String username, String password) {
        return LoginRepositoryImpl.getInstance().checkLogin(username, password);
    }
}
