package com.echannelling.model;

public class LabAppointmentModel {
    private int appointmentId;
    private int testId;
    private String testName;
    private double testPrice;
    private String patientName;
    private String email;
    private String appointmentDate;
    private String appointmentTime;
    private String hospital;

    // Payment Details
    private String paymentStatus;
    private String paymentDate;
    private double paymentAmount;

    // Default Constructor
    public LabAppointmentModel() {}

    // Parameterized Constructor
    public LabAppointmentModel(int testId, String testName, double testPrice, String patientName, String email, String appointmentDate, String appointmentTime, String hospital) {
        this.testId = testId;
        this.testName = testName;
        this.testPrice = testPrice;
        this.patientName = patientName;
        this.email = email;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.hospital = hospital;
        this.paymentStatus = "Pending";
        this.paymentDate = null;
        this.paymentAmount = 0.0;
    }

    // Getters and Setters
    // (All the getter and setter methods for each field)

    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public int getTestId() { return testId; }
    public void setTestId(int testId) { this.testId = testId; }

    public String getTestName() { return testName; }
    public void setTestName(String testName) { this.testName = testName; }

    public double getTestPrice() { return testPrice; }
    public void setTestPrice(double testPrice) { this.testPrice = testPrice; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(String appointmentDate) { this.appointmentDate = appointmentDate; }

    public String getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(String appointmentTime) { this.appointmentTime = appointmentTime; }

    public String getHospital() { return hospital; }
    public void setHospital(String hospital) { this.hospital = hospital; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getPaymentDate() { return paymentDate; }
    public void setPaymentDate(String paymentDate) { this.paymentDate = paymentDate; }

    public double getPaymentAmount() { return paymentAmount; }
    public void setPaymentAmount(double paymentAmount) { this.paymentAmount = paymentAmount; }
}
