package com.sns.follow;

import java.util.List;

import com.sns.user.UserVO;

public interface FollowService {
	
	void insertFollow(FollowVO vo);
	
	void deleteFollow(FollowVO vo);
	
	int checkFollow(FollowVO vo);
	
	List<UserVO> getFollowList(FollowVO vo);
	
	int countFollow(FollowVO vo);
}
