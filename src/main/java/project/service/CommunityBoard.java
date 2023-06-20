package project.service;

import java.util.List;

import project.VO.CommunityVO;

public interface CommunityBoard {
	List<CommunityVO> getCommunityList(CommunityVO searchVO);
	int getListCnt();
}
