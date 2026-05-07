package com.insurance.model;

public class MobileDevice {
    private String imei;
    private String brand;
    private String model;

    public MobileDevice(String imei, String brand, String model) {
        this.imei = imei;
        this.brand = brand;
        this.model = model;
    }

    public String getImei()  { return imei; }
    public String getBrand() { return brand; }
    public String getModel() { return model; }

    public String getDetails() {
        return brand + " " + model + " (IMEI: " + imei + ")";
    }
}
