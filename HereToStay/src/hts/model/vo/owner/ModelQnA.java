package hts.model.vo.owner;

import java.util.List;

import hts.mongo.vo.MongoVO;

public class ModelQnA {
	private String qnaDate;
	private String userId;
	private String qnaTitle;
	private String qnaPhoto;
	private String qnaType;
	private String qnaContext;
	private String mgrId;
	private String qnaReply;
	private String qnaStatus;
	private String mgrName;
	private String qnaId;
	// 추가
	private List<MongoVO> photoList;
		
	public List<MongoVO> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<MongoVO> photoList) {
		this.photoList = photoList;
	}
	
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaPhoto() {
		return qnaPhoto;
	}
	public void setQnaPhoto(String qnaPhoto) {
		this.qnaPhoto = qnaPhoto;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public String getQnaContext() {
		return qnaContext;
	}
	public void setQnaContext(String qnaContext) {
		this.qnaContext = qnaContext;
	}
	public String getMgrId() {
		return mgrId;
	}
	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}
	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public String getQnaId() {
		return qnaId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}
}