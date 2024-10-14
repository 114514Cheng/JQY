package dto;

import java.util.ArrayList;
import java.util.Collection;

import entity.Reservation;

public class UserDTO {
	private int id;
	private String name;
	private String password;
	private String gender;
	private String email;
	private String telnumber;
	
	private Collection<Reservation> reservations= new  ArrayList<Reservation>();
	
	public UserDTO() {
		
	}
	
	public void setName(String nameString) {
		name = nameString;
	}
	
	public void setPass(String passString) {
		password = passString;
	}
	
	public void setGender(String gendString) {
		gender = gendString;
	}
	
	public void setEmail(String eMAILString) {
		email = eMAILString;
	}
	
	public void setPhone(String phoneString) {
		telnumber =phoneString;
	}
	
	
	public String getName() {
		return name;
	}
	
	public String getGender() {
		return gender;
	}
	
	public String getPhone() {
		return telnumber;
	}
	
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public int getId() {
		return id;
	}
}
