package com.sns.repository.follow;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.follow.FollowVO;
import com.sns.user.UserVO;

@Repository("followDAO")
public class FollowDAO {
	@Autowired
    private SqlSessionTemplate mybatis;
	
	public void insertFollow(FollowVO vo) {
        System.out.println("===> Mybatis로 insertFollow() 기능 처리");
        mybatis.insert("followDAO.insertFollow", vo);
    }
	
	public void deleteFollow(FollowVO vo) {
        System.out.println("===> Mybatis로 deleteFollow() 기능 처리");
        mybatis.delete("followDAO.deleteFollow", vo);
    }
	
	public int checkFollow(FollowVO vo) {
		System.out.println("===> Mybatis로 checkFollow() 기능 처리");
		return mybatis.selectOne("followDAO.checkFollow", vo);
	}
	
	public List<UserVO> getFollowList(FollowVO vo) {
        System.out.println("===> Mybatis로 getFollowList() 기능 처리");
        return mybatis.selectList("followDAO.getFollowList", vo);
    }
	
	public int countFollow(FollowVO vo) {
		System.out.println("===> Mybatis로 countFollow() 기능 처리");
		return mybatis.selectOne("followDAO.countFollow", vo);
	}
}
