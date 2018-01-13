package com.sns.repository.post;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.post.PostVO;
import com.sns.user.UserVO;

@Repository("postDAO")
public class PostDAO {
	
	@Autowired
    private SqlSessionTemplate mybatis;

    public void insertPost(PostVO vo) {
        System.out.println("===> Mybatis로 insertPost() 기능 처리");
        mybatis.insert("postDAO.insertPost", vo);
    }

    public void updatePost(PostVO vo) {
        System.out.println("===> Mybatis로 updatePost() 기능 처리");
        mybatis.update("postDAO.updatePost", vo);
    }

    public void deletePost(PostVO vo) {
        System.out.println("===> Mybatis로 deletePost() 기능 처리");
        mybatis.delete("postDAO.deletePost", vo);
    }

    public PostVO getPost(PostVO vo) {
        System.out.println("===> Mybatis로 getPost() 기능 처리");
        return mybatis.selectOne("postDAO.getPost", vo);
    }
    
    public List<PostVO> getPostList() {
        System.out.println("===> Mybatis로 getPostList() 기능 처리");
        return mybatis.selectList("postDAO.getPostList", null);
    }

}
