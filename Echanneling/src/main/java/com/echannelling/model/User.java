package com.echannelling.model;

import java.sql.Date;

// This class demonstrates OOP concepts such as Encapsulation, Abstraction, and Polymorphism (constructor overloading)
public class User {

    // Encapsulation: Fields are marked private to restrict direct access from outside
    private int id;
    private String title;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String nic;
    private String password;
    private String address;
    private String role;
    private Date registeredDate;
    private String profileImage;
    
    // Constructor Overloading (Compile-time Polymorphism)
    // Default constructor
    public User() {}

    // Constructor Overloading (Compile-time Polymorphism)
    // Parameterized constructor to initialize all fields
    public User(int id, String title, String firstName, String lastName, String email, String phone, String nic, String password, String address, String role, Date registeredDate, String profileImage) {
        this.id = id;
        this.title = title;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.nic = nic;
        this.password = password;
        this.address = address;
        this.role = role;
        this.registeredDate = registeredDate;
        this.profileImage = profileImage;
    }

    // Abstraction & Encapsulation:
    // Public getter and setter methods provide controlled access to private fields

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public Date getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(Date date) {
        this.registeredDate = date;
    }
    
    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }
}
