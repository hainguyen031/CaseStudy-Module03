package repository.Impl;

import entity.Booking;
import repository.ConnectionConfig;
import repository.IBookingRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BookingRepositoryImpl implements IBookingRepository {
    private static final BookingRepositoryImpl bookingRepositoryImpl = new BookingRepositoryImpl();
    private BookingRepositoryImpl() {}
    public static BookingRepositoryImpl getInstance() {
        return bookingRepositoryImpl;
    }
    Connection connection = ConnectionConfig.getConnection();
    private static final String FIND_BOOKING_BY_USERID = "{CALL findBookingByUserID(?)}";


    @Override
    public List<Booking> findBookingByUserID(int userId) {
        List<Booking> bookingList = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_BOOKING_BY_USERID);
            callableStatement.setString(1, String.valueOf(userId));
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String cccd = rs.getString("cccd");
                String gplx = rs.getString("gplx");
                String pickupLocation = rs.getString("pickup_location");
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                int rentPrice = Integer.parseInt(rs.getString("rental_price"));
                LocalDate startDate = LocalDate.parse(rs.getString("startdate"));
                LocalDate endDate = LocalDate.parse(rs.getString("enddate"));
                Booking booking = new Booking(username, email, phone, cccd, gplx, pickupLocation, brand, model, rentPrice, startDate, endDate);
                bookingList.add(booking);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }
}
