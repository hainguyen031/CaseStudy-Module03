package repository.Impl;

import entity.User;
import repository.ConnectionConfig;
import repository.ILoginRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginRepositoryImpl implements ILoginRepository {
    private static final LoginRepositoryImpl loginRepositoryImpl = new LoginRepositoryImpl();
    public LoginRepositoryImpl() {}
    public static LoginRepositoryImpl getInstance() {
        return loginRepositoryImpl;
    }
    ConnectionConfig connectionConfig = new ConnectionConfig();
    private static final String SELECT_ACCOUNT = "SELECT username, password, email, phone FROM user WHERE username = ? and password =?;";

    @Override
    public User checkLogin(String username, String password) {
        User user = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionConfig.getConnection().prepareStatement(SELECT_ACCOUNT);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            String usernameData;
            String passwordData;
            String emailData;
            String phoneData;
            while (resultSet.next()){
                usernameData = resultSet.getString("username");
                passwordData = resultSet.getString("password");
                emailData = resultSet.getString("email");
                phoneData = resultSet.getString("phone");

                user = new User(usernameData,passwordData,emailData,phoneData);
            }
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (Exception throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }
}
