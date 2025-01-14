package com.sathya.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sathya.connection.DbConnection;
import com.sathya.entity.BookingDetails;
import com.sathya.entity.Contact;

public class HotelDAO {

	public int getAvailableRooms(String type) {
		int count = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select rooms_available from hostel_details where Category = ?");) {

			preparedStatement.setString(1, type);

			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			count = resultSet.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("connection failed");
		}

		return count;
	}

	public int saveBookingDetails(BookingDetails details) {
		int count = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"insert into booking_details(username,roomtype, rentPerDay, checkindate, checkoutdate, duration, totalRent, sgst, cgst, discount, rentToPay, aadhaarfront, aadhaarback) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");) {
			preparedStatement.setString(1, details.getUserName());
			preparedStatement.setString(2, details.getRoomType());
			preparedStatement.setInt(3, details.getRentPerDay());
			preparedStatement.setDate(4, details.getCheckInDate());
			preparedStatement.setDate(5, details.getCheckOutDate());
			preparedStatement.setInt(6, details.getDuration());
			preparedStatement.setDouble(7, details.getTotalRent());
			preparedStatement.setDouble(8, details.getSgst());
			preparedStatement.setDouble(9, details.getCgst());
			preparedStatement.setDouble(10, details.getDiscount());
			preparedStatement.setDouble(11, details.getRentToPay());
			preparedStatement.setBytes(12, details.getAadhaarFront());
			preparedStatement.setBytes(13, details.getAadhaarBack());

			count = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int bookRoom(String roomType) {
		int result = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"update hostel_details set rooms_available=rooms_available-1 where category=?");) {
			preparedStatement.setString(1, roomType);

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int rentPerDay(String roomType) {
		int rent = 0;
		if (roomType.equals("luxury"))
			rent = 800;
		else if (roomType.equals("deluxe"))
			rent = 500;
		else
			rent = 300;
		return rent;
	}

	public int saveContact(Contact contact) {
		int result = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("insert into contact_details values(?,?,?,?)");) {

			preparedStatement.setString(1, contact.getUsername());
			preparedStatement.setString(2, contact.getName());
			preparedStatement.setLong(3, contact.getMobile());
			preparedStatement.setString(4, contact.getComments());
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
