package project.VO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;



public class CommunityVO {
	public CommunityVO() {
	}
	
	public CommunityVO(int comarticleno, String comtitle, String comwriter_id, String comcontent, Date comwriter_date) {
		this.comarticleno = comarticleno;
		this.comtitle = comtitle;
		this.comwriter_id = comwriter_id;
		this.comcontent = comcontent;
		this.comwriter_date = comwriter_date;
	}

	private int comarticleno;
	private String comtitle;
	private String comwriter_id;
	private String comcontent;
	private Date comwriter_date;
	
	public int getComarticleno() {
		return comarticleno;
	}
	public void setComarticleno(int comarticleno) {
		this.comarticleno = comarticleno;
	}
	public String getComtitle() {
		return comtitle;
	}
	public void setComtitle(String comtitle) {
		this.comtitle = comtitle;
	}
	public String getComwriter_id() {
		return comwriter_id;
	}
	public void setComwriter_id(String comwriter_id) {
		this.comwriter_id = comwriter_id;
	}
	public String getComcontent() {
		return comcontent;
	}
	public void setComcontent(String comcontent) {
		this.comcontent = comcontent;
	}
	public Date getComwriter_date() {
		return comwriter_date;
	}
	public void setComwriter_date(Date comwriter_date) {
		this.comwriter_date = comwriter_date;
	}


}
