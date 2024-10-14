package dto;

import java.sql.Date;

import entity.Sight;
import entity.User;

public class ReservationDTO {
	
	private int id;
	private User user;
	private Sight sight;
	private Date time;
	private boolean down;
	public void setUser(User user) {
		this.user = user;
	}
	
	public void setSight(Sight sight) {
		this.sight = sight;
	}
	
	public void setDate(Date time) {
		this.time = time;
	}
	
	public void setDown(boolean state) {
		down = state;
	}
	
	public User getUser() {
		return user;
	}
	
	public Sight getSight() {
		return sight;
	}
}
