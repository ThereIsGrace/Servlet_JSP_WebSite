package project.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int Articleno;
	private String subject;
	private String writer_id;
	private String T_name;
	private String content;
	private int grade;
	private Date writer_date;
	public int getArticleno() {
		return Articleno;
	}
	public void setArticleno(int articleno) {
		Articleno = articleno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getT_name() {
		return T_name;
	}
	public void setT_name(String t_name) {
		T_name = t_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getWriter_date() {
		return writer_date;
	}
	public void setWriter_date(Date writer_date) {
		this.writer_date = writer_date;
	}
}
