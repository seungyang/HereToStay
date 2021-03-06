package hts.model.vo.member;

import java.util.List;

import hts.mongo.vo.MongoVO;

public class Review {
	private String revPhoto;
	private String revTitle;
	private String penName;
	private int revStar;
	private String romName;
	private String penId;
	private String revId;
	private String revContext;
	private String revDate;
	private String resId;
	
	//추가 
	private String memId;

	// 추가
	private List<MongoVO> photoList;
	
	public List<MongoVO> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<MongoVO> photoList) {
		this.photoList = photoList;
	}
	
	public String getRevPhoto() {
		return revPhoto;
	}

	public void setRevPhoto(String revPhoto) {
		this.revPhoto = revPhoto;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getPenName() {
		return penName;
	}

	public void setPenName(String penName) {
		this.penName = penName;
	}

	public int getRevStar() {
		return revStar;
	}

	public void setRevStar(int revStar) {
		this.revStar = revStar;
	}

	public String getRomName() {
		return romName;
	}

	public void setRomName(String romName) {
		this.romName = romName;
	}

	public String getPenId() {
		return penId;
	}

	public void setPenId(String penId) {
		this.penId = penId;
	}

	public String getRevId() {
		return revId;
	}

	public void setRevId(String revId) {
		this.revId = revId;
	}

	public String getRevContext() {
		return revContext;
	}

	public void setRevContext(String revContext) {
		this.revContext = revContext;
	}

	public String getRevDate() {
		return revDate;
	}

	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
}