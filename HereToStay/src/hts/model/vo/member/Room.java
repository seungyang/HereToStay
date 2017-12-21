package hts.model.vo.member;

import java.util.ArrayList;
import java.util.List;

import hts.mongo.vo.MongoVO;

public class Room {
	private String romId;
	private String penId;
	private String romName;
	private String romType;
	private String romPeople;
	private String romIntro;
	private String romOpt;
	private int romCost;
	private String romStatus;
	private String penName;
	private String minPeople;
	private ArrayList<MongoVO> photoList;	
	
	
	
	
	public String getMinPeople() {
		return minPeople;
	}
	public void setMinPeople(String minPeople) {
		this.minPeople = minPeople;
	}
	public ArrayList<MongoVO> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(ArrayList<MongoVO> photoList) {
		this.photoList = photoList;
	}
	public String getRomId() {
		return romId;
	}
	public void setRomId(String romId) {
		this.romId = romId;
	}
	public String getPenId() {
		return penId;
	}
	public void setPenId(String penId) {
		this.penId = penId;
	}
	public String getRomName() {
		return romName;
	}
	public void setRomName(String romName) {
		this.romName = romName;
	}
	public String getRomType() {
		return romType;
	}
	public void setRomType(String romType) {
		this.romType = romType;
	}
	public String getRomPeople() {
		return romPeople;
	}
	public void setRomPeople(String romPeople) {
		this.romPeople = romPeople;
	}
	public String getRomIntro() {
		return romIntro;
	}
	public void setRomIntro(String romIntro) {
		this.romIntro = romIntro;
	}
	public String getRomOpt() {
		return romOpt;
	}
	public void setRomOpt(String romOpt) {
		this.romOpt = romOpt;
	}
	public int getRomCost() {
		return romCost;
	}
	public void setRomCost(int romCost) {
		this.romCost = romCost;
	}
	public String getRomStatus() {
		return romStatus;
	}
	public void setRomStatus(String romStatus) {
		this.romStatus = romStatus;
	}
	public String getPenName() {
		return penName;
	}
	public void setPenName(String penName) {
		this.penName = penName;
	}
}
