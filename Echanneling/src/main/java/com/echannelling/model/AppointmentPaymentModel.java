package com.echannelling.model;

public class AppointmentPaymentModel {

	private int methodID;
	private String cardHolder;
	private String cardNo;
	private String expMonth;
	private String cvv;
	
	public AppointmentPaymentModel(int methodID, String cardHolder, String cardNo, String expMonth, String CVV) {
		super();
		this.methodID = methodID;
		this.cardHolder = cardHolder;
		this.cardNo = cardNo;
		this.expMonth = expMonth;
		this.cvv = CVV;
	}

	public int getMethodID() {
		return methodID;
	}

	public void setMethodID(int methodID) {
		this.methodID = methodID;
	}

	public String getCardHolder() {
		return cardHolder;
	}

	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getExpMonth() {
		return expMonth;
	}

	public void setExpMonth(String expMonth) {
		this.expMonth = expMonth;
	}

	public String getCVV() {
		return cvv;
	}

	public void setCVV(String CVV) {
		cvv = CVV;
	}
	
	
}
