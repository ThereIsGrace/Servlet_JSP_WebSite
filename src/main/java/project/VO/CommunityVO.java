package project.VO;

import java.sql.Date;

import lombok.Data;



public class CommunityVO {
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
