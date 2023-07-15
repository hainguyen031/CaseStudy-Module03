package entity;

public class Car {
    private int id;
    private static int countId = 0;
    private String brand;
    private String model;
    private int seats;
    private int rentPrice;
    private boolean available = true;
    private String describe;
    private String url;
    private String url2;
    private String url3;
    private String url4;
    private String carLocation;
    public Car() {
    }

    public Car(int id, String brand, String model, int seats, int rentPrice, boolean available, String describe, String url, String url2, String url3, String url4, String carLocation) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.seats = seats;
        this.rentPrice = rentPrice;
        this.available = available;
        this.describe = describe;
        this.url = url;
        this.url2 = url2;
        this.url3 = url3;
        this.url4 = url4;
        this.carLocation = carLocation;
    }

    public Car(String brand, String model, int seats, int rentPrice, boolean available, String describe, String url, String url2, String url3, String url4, String carLocation) {
        this.brand = brand;
        this.model = model;
        this.seats = seats;
        this.rentPrice = rentPrice;
        this.available = available;
        this.describe = describe;
        this.url = url;
        this.url2 = url2;
        this.url3 = url3;
        this.url4 = url4;
        this.carLocation = carLocation;
    }

    public Car(int id, int rentPrice, String describe, String url, String url2, String url3, String url4) {
        this.id = id;
        this.rentPrice = rentPrice;
        this.describe = describe;
        this.url = url;
        this.url2 = url2;
        this.url3 = url3;
        this.url4 = url4;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public int getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(int rentPrice) {
        this.rentPrice = rentPrice;
    }

    public boolean getAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }


    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl2() {
        return url2;
    }

    public void setUrl2(String url2) {
        this.url2 = url2;
    }

    public String getUrl3() {
        return url3;
    }

    public void setUrl3(String url3) {
        this.url3 = url3;
    }

    public String getUrl4() {
        return url4;
    }

    public void setUrl4(String url4) {
        this.url4 = url4;
    }

    public String getCarLocation() {
        return carLocation;
    }

    public void setCarLocation(String carLocation) {
        this.carLocation = carLocation;
    }

    @Override
    public String toString() {
        return "Car{" +
                "ID='" + id + '\'' +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", seats=" + seats +
                ", rentalPrice=" + rentPrice +
                '}';
    }

    public String toStringForStaff() {
        return "Car{" +
                "ID='" + id + '\'' +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", seats=" + seats +
                ", rentalPrice=" + rentPrice +
                ", available=" + available +
                '}';
    }

    public String[] toArray() {
        return new String[]{String.valueOf(id), brand, model, String.valueOf(seats), String.valueOf(rentPrice), String.valueOf(available), describe};
    }
}
