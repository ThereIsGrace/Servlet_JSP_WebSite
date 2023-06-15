package project;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {

	private int Articleno;
	private String subject;
	private String writer_id;
	private String T_name;
	private String content;
	private int grade;
	private Date writer_date;
	
}
