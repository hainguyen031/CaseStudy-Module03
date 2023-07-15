package entity;

import java.time.LocalDate;

public class Booking {
    private String username;
    private String email;
    private String phone;
    private String brand;
    private String model;
    private int rentPrice;
    private int bookingId;
    private int customerId;
    private int carId;
    private LocalDate startDate;
    private LocalDate endDate;
    private String cccd;
    private String gplx;
    private String pickupLocation;
    private int deposit;

    public Booking() {
    }

    public Booking(int customerId, int carId, LocalDate startDate, LocalDate endDate, String cccd, String gplx, String pickupLocation) {
        this.customerId = customerId;
        this.carId = carId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cccd = cccd;
        this.gplx = gplx;
        this.pickupLocation = pickupLocation;

    }

    public Booking(String username, String email, String phone, String cccd, String gplx, String pickupLocation, String brand, String model, int rentPrice, LocalDate startDate, LocalDate endDate) {
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.cccd = cccd;
        this.gplx = gplx;
        this.pickupLocation = pickupLocation;
        this.brand = brand;
        this.model = model;
        this.rentPrice = rentPrice;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public int getDeposit() {
        return deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getGplx() {
        return gplx;
    }

    public void setGplx(String gplx) {
        this.gplx = gplx;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(int rentPrice) {
        this.rentPrice = rentPrice;
    }
}
