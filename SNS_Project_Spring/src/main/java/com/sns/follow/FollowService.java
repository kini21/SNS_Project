package com.sns.follow;

import java.util.List;
import java.util.Map;

public interface FollowService {
	
	void insertFollow(FollowVO vo);
	
	void deleteFollow(FollowVO vo);
	
	int checkFollow(FollowVO vo);
	
	List<FollowVO> getFollowList(FollowVO vo);
	
	int countFollow(FollowVO vo);
}
