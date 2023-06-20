package project.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import project.VO.CommunityVO;

public class makeJSON {
	
	public static String makeJson(List<CommunityVO> comList) {
		String result = "";
		result += "{\"communityList\":[";
		for(int i = 0; i < comList.size(); i++) {
			CommunityVO cv = comList.get(i);
			result += "{\"제목\":";
			result += "\""+cv.getComtitle() + "\",";
			result += "\"글번호\":" + cv.getComarticleno() + "\",";
			result += "\"일자\":" + cv.getComwriter_date() + "\",";
			result += "\"작성자\":" + cv.getComwriter_id() + "\"";
			result += "}";
			if(i != comList.size()-1)
			result += ",";
		}
		result += "]}";
		return result;
	}
}
