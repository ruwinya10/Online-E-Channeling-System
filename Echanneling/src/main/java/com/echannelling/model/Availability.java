package com.echannelling.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

//This class represents a doctor's availability for appointments in the eChannelling system
public class Availability {
    private int availability_id;
    private int doctor_id;
    private String hospital_name;
    private String location;
    private String day;
    private LocalDateTime time;
    private int max_patients;
    private BigDecimal fee;

    // Constructor to initialize all fields of the Availability class
    public Availability(int availability_id, int doctor_id, String hospital_name, String location, String day, LocalDateTime time, int max_patients, BigDecimal fee) {
        this.availability_id = availability_id;
        this.doctor_id = doctor_id;
        this.hospital_name = hospital_name;
        this.location = location;
        this.day = day;
        this.time = time;
        this.max_patients = max_patients;
        this.fee = fee;
    }

    // Getter and setter methods for each field to allow encapsulated access and modification
    public int getAvailability_id() {
        return availability_id;
    }

    public void setAvailability_id(int availability_id) {
        this.availability_id = availability_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getHospital_name() {
        return hospital_name;
    }

    public void setHospital_name(String hospital_name) {
        this.hospital_name = hospital_name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public int getMax_patients() {
        return max_patients;
    }

    public void setMax_patients(int max_patients) {
        this.max_patients = max_patients;
    }

    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }
}