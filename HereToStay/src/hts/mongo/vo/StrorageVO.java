package hts.mongo.vo;

import org.springframework.data.annotation.Id;

public class StrorageVO {

	@Id
	private String id;
	
	private String code;
	private String bath;
	private String charcoal;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getBath() {
		return bath;
	}
	public void setBath(String bath) {
		this.bath = bath;
	}
	public String getCharcoal() {
		return charcoal;
	}
	public void setCharcoal(String charcoal) {
		this.charcoal = charcoal;
	}
	


	
}
