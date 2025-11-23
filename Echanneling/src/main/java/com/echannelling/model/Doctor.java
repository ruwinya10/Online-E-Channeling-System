package com.echannelling.model;

public class Doctor {
    private int doctor_id;
    private String full_name;
    private String title;
    private String specialization;
    private String qualifications;
    private int experience;
    private String gender;
    private String contact;
    private String email;
    private String profile_photo;

    // Constructor to initialize all fields of the Doctor class
    public Doctor(int doctor_id, String full_name, String title, String specialization, String qualifications, int experience, String gender, String contact, String email, String profile_photo) {
        this.doctor_id = doctor_id;
        this.full_name = full_name;
        this.title = title;
        this.specialization = specialization;
        this.qualifications = qualifications;
        this.experience = experience;
        this.gender = gender;
        this.contact = contact;
        this.email = email;
        this.profile_photo = profile_photo;
    }

    // Getter and setter methods for each field to allow encapsulated access and modification
    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getQualifications() {
        return qualifications;
    }

    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfile_photo() {
        return profile_photo;
    }

    public void setProfile_photo(String profile_photo) {
        this.profile_photo = profile_photo;
    }
}