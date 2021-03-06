package hts.model.vo.manager;

import java.util.List;

import hts.mongo.vo.MongoVO;

public class QnA extends ManagerPaging{
	private String qnaPhoto;
	private String qnaId;
	private String qnaTitle;
	private String qnaType;
	private String qnaContext;
	private String qnaStatus;
	private String qnaReply;
	private String qnaDate;
	private String mgrId;
	private String userId;
	
	// 추가
		private List<MongoVO> photoList;
		
		public List<MongoVO> getPhotoList() {
			return photoList;
		}
		public void setPhotoList(List<MongoVO> photoList) {
			this.photoList = photoList;
		}
		
		public String getQnaPhoto() {
			return qnaPhoto;
		}
		public void setQnaPhoto(String qnaPhoto) {
			this.qnaPhoto = qnaPhoto;
		}

	public String getQnaId() {
		return qnaId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
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
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getMgrId() {
		return mgrId;
	}
	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
