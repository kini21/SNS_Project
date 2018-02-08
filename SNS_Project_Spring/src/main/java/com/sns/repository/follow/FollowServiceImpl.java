package com.sns.repository.follow;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.follow.FollowService;
import com.sns.follow.FollowVO;

@Service("followService")
public class FollowServiceImpl implements FollowService{
	@Autowired
    private FollowDAO followDAO;
	
	@Override
    public void insertFollow(FollowVO vo) {
        followDAO.insertFollow(vo);
    }
	
	@Override
    public void deleteFollow(FollowVO vo) {
        followDAO.deleteFollow(vo);
    }
	
	public int checkFollow(FollowVO vo) {
		return followDAO.checkFollow(vo);
	}
	
	@Override
    public List<FollowVO> getFollowList(FollowVO vo) {
        return followDAO.getFollowList(vo);
    }
	
	@Override
	public int countFollow(FollowVO vo) {
		return followDAO.countFollow(vo);
	}
}
