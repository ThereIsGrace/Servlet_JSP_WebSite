package project.VO;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MenTeeVO {
	
	private String M_id;
	private String M_pwd;
	private int M_age;
	private String M_name;
	private String M_area;
	private String M_phonum;
	private String M_subject;
	
	public String getM_id() {
		return M_id;
	}
	public void setM_id(String m_id) {
		M_id = m_id;
	}
	public String getM_pwd() {
		return M_pwd;
	}
	public void setM_pwd(String m_pwd) {
		M_pwd = m_pwd;
	}
	public int getM_age() {
		return M_age;
	}
	public void setM_age(String m_age) {
		Date da=new Date();
		SimpleDateFormat si=new SimpleDateFormat("yyyy");
		String userage=m_age.substring(0,4);
		String guswo=si.format(da);
		int user=Integer.parseInt(userage);
		int guswotlrks=Integer.parseInt(guswo);
		this.M_age=user-guswotlrks;
	}
	public String getM_name() {
		return M_name;
	}
	public void setM_name(String m_name) {
		M_name = m_name;
	}
	public String getM_area() {
		return M_area;
	}
	public void setM_area(String m_area) {
		M_area = m_area;
	}
	public String getM_phonum() {
		return M_phonum;
	}
	public void setM_phonum(String m_phonum) {
		M_phonum = m_phonum;
	}
	public String getM_subject() {
		return M_subject;
	}
	public void setM_subject(String m_subject) {
		M_subject = m_subject;
	}
}
