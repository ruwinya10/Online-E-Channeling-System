package com.echannelling.model;

public class AppointmentBookingModel {
    private int bookingID;         // Unique ID for the booking
    private int appointmentID;     // Reference to the patient details in appointmentdetails
    private int methodID;          // Reference to the payment details in appointmentpayment
    private String doctorName;     // Doctor's name
    private String specialization; // Doctor's specialization
    private String hospital;       // Hospital name
    private String date;           // Appointment date
    private String time;           // Appointment time

    // Constructor
    public AppointmentBookingModel(int bookingID, int appointmentID, int methodID, String doctorName, 
                                   String specialization, String hospital, String date, String time) {
        this.bookingID = bookingID;
        this.appointmentID = appointmentID;
        this.methodID = methodID;
        this.doctorName = doctorName;
        this.specialization = specialization;
        this.hospital = hospital;
        this.date = date;
        this.time = time;
    }

    // Getters
    public int getBookingID() {
        return bookingID;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public int getMethodID() {
        return methodID;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getSpecialization() {
        return specialization;
    }

    public String getHospital() {
        return hospital;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }
}