package dto;

import java.util.ArrayList;
import java.util.Collection;

import entity.Reservation;

public class SightDTO {
	private int id;
	private String name;
	private String explain;
	
	private Collection<Reservation> reservations= new  ArrayList<Reservation>();
	
	public void setName(String nameString) {
		name = nameString;
	}
	
	public void setExplain(String exString) {
		explain = exString;
	}
	
	public String getName() {
		return name;
	}
	
	public String getExplain() {
		return explain;
	}
	
	public Collection<Reservation> getReservation(){
		return reservations;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
}
