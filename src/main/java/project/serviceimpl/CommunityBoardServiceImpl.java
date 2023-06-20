package project.serviceimpl;

import java.util.List;

import project.DAO.CommunityDAO;
import project.VO.CommunityVO;
import project.service.CommunityBoard;

public class CommunityBoardServiceImpl implements CommunityBoard{

	CommunityDAO comDao = CommunityDAO.getInstance();
	
	@Override
	public List<CommunityVO> getCommunityList(CommunityVO searchVO) {
		return comDao.readCommunity(searchVO);
	}

	@Override
	public int getListCnt() {
		return comDao.getListCnt();
	}
}
