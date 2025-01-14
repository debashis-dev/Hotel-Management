package com.sathya.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingDetails {
	private String bookingId;
	private String userName;
	private String roomType;
	private int rentPerDay;
	private Date checkInDate;
	private Date checkOutDate;
	private int duration;
	private double totalRent;
	private double sgst;
	private double cgst;
	private double discount;
	private double rentToPay;
	private byte[] aadhaarFront;
	private byte[] aadhaarBack;

}
