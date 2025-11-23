package com.echannelling.model;

public class AppointmentModel {

	private int appointmentID;
	private String name;
	private String age;
	private String gender;
	private String email;
	private String phone;
	
	public AppointmentModel(int appointmentID, String name, String age, String gender, String email, String phone) {
		super();
		this.appointmentID = appointmentID;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}

	public int getAppointmentID() {
		return appointmentID;
	}

	public void setAppointmentID(int appointmentID) {
		this.appointmentID = appointmentID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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
	
	
}
