package project.VO;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TutorVO {
	private String T_id;
	private String T_pwd;
	private int T_age;
	private String T_name;
	private String T_area;
	private String T_phonum;
	private String T_subject;
	private String T_suiv;
	public String getT_id() {
		return T_id;
	}
	public void setT_id(String t_id) {
		T_id = t_id;
	}
	public String getT_pwd() {
		return T_pwd;
	}
	public void setT_pwd(String t_pwd) {
		T_pwd = t_pwd;
	}
	public int getT_age() {
		return T_age;
	}
	public void setT_age(String t_age) {
		Date da=new Date();
		SimpleDateFormat si=new SimpleDateFormat("yyyy");
		String userage=t_age.substring(0,4);
		String guswo=si.format(da);
		int user=Integer.parseInt(userage);
		int guswotlrks=Integer.parseInt(guswo);
		this.T_age=user-guswotlrks;
;	}
	public String getT_name() {
		return T_name;
	}
	public void setT_name(String t_name) {
		T_name = t_name;
	}
	public String getT_area() {
		return T_area;
	}
	public void setT_area(String t_area) {
		T_area = t_area;
	}
	public String getT_phonum() {
		return T_phonum;
	}
	public void setT_phonum(String t_phonum) {
		T_phonum = t_phonum;
	}
	public String getT_subject() {
		return T_subject;
	}
	public void setT_subject(String t_subject) {
		T_subject = t_subject;
	}
	public String getT_suiv() {
		return T_suiv;
	}
	public void setT_suiv(String t_suiv) {
		T_suiv = t_suiv;
	}

}
