package com.sathya.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sathya.connection.DbConnection;
import com.sathya.entity.BookingDetails;
import com.sathya.entity.User;

public class UserDao {

	public int searchUser(String userName) {
		System.out.println("User name: " + userName);
		int result = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select username from user_details where username=?");) {
			preparedStatement.setString(1, userName);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int searchEmail(String email) {
		System.out.println("Email: " + email);
		int result = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select email from user_details where email=?");) {
			preparedStatement.setString(1, email);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int save(User user) {
		int count = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("insert into user_details values(?,?,?,?,?,?,?)");) {
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getFullName());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setLong(5, user.getMobile());
			preparedStatement.setDate(6, user.getDob());
			preparedStatement.setString(7, user.getAddress());

			count = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}

	public User findDetails(String Username, String Password) {
		User user = null;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from user_details where username=? and password =? ");) {
			preparedStatement.setString(1, Username);
			preparedStatement.setString(2, Password);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new User();
				user.setUserName(resultSet.getString(1));
				user.setFullName(resultSet.getString(2));
				user.setPassword(resultSet.getString(3));
				user.setEmail(resultSet.getString(4));
				user.setMobile(resultSet.getLong(5));
				user.setDob(resultSet.getDate(6));
				user.setAddress(resultSet.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public String getEmail(String userName) {
		String email = null;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select email from user_details where username=?");) {
			preparedStatement.setString(1, userName);

			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			email = resultSet.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}

	public String getPassword(String userName, String email, Date dob) {
		String password = null;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"select password from user_details where username=? and email=? and dob=?");) {
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, email);
			preparedStatement.setDate(3, dob);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				password = resultSet.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return password;
	}

	public String getUsername(String name, String email, Date dob, Long mobile) {
		String username = null;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"select username from user_details where name=? and email=? and dob=? and mobile=?")) {
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setDate(3, dob);
			preparedStatement.setLong(4, mobile);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				username = resultSet.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return username;
	}

	public int updateUserDetails(User user) {
		int result = 0;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"update user_details set name=?, password=?, email=?,  mobile=?, dob=?, address=? where username=?");) {
			preparedStatement.setString(1, user.getFullName());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setLong(4, user.getMobile());
			preparedStatement.setDate(5, user.getDob());
			preparedStatement.setString(6, user.getAddress());
			preparedStatement.setString(7, user.getUserName());
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<BookingDetails> previousBookingDetails(String username) {
		List<BookingDetails> previousBookings = new ArrayList<BookingDetails>();
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from booking_details where username=?");) {
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				BookingDetails details = new BookingDetails();
				details.setBookingId(resultSet.getString(1));
				details.setUserName(resultSet.getString(2));
				details.setRoomType(resultSet.getString(3));
				details.setRentPerDay(resultSet.getInt(4));
				details.setCheckInDate(resultSet.getDate(5));
				details.setCheckOutDate(resultSet.getDate(6));
				details.setDuration(resultSet.getInt(7));
				details.setTotalRent(resultSet.getInt(8));
				details.setSgst(resultSet.getDouble(9));
				details.setCgst(resultSet.getDouble(10));
				details.setDiscount(resultSet.getDouble(11));
				details.setRentToPay(resultSet.getDouble(12));
				details.setAadhaarFront(resultSet.getBytes(13));
				details.setAadhaarBack(resultSet.getBytes(14));
				previousBookings.add(details);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("connection failed");
		}
		return previousBookings;
	}

	public String getPassword(String username) {
		String password = null;
		try (Connection connection = DbConnection.createConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"select password from user_details where username=?");) {
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				password = resultSet.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return password;
	}
}
