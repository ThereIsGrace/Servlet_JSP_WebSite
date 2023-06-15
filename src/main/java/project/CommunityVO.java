package project;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class CommunityVO {
	
	private int comarticleno;
	private String comtitle;
	private String comwriter_id;
	private String comcontent;
	private Date comwriter_date;
	
	

}
