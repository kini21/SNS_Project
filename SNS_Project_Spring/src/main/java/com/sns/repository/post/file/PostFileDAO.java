package com.sns.repository.post.file;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.post.file.PostFileVO;

@Repository("postfileDAO")
public class PostFileDAO {

	@Autowired
    private SqlSessionTemplate mybatis;

    public void insertPostFile(PostFileVO vo) {
        System.out.println("===> Mybatis로 insertPostFile() 기능 처리");
        mybatis.insert("postfileDAO.insertPostFile", vo);
    }

    public void deletePostFile(PostFileVO vo) {
        System.out.println("===> Mybatis로 deletePostFile() 기능 처리");
        mybatis.delete("postfileDAO.deletePostFile", vo);
    }

    public PostFileVO getPostFile(PostFileVO vo) {
        System.out.println("===> Mybatis로 getPostFile() 기능 처리");
        return mybatis.selectOne("postfileDAO.getPostFile", vo);
    }
    
    public List<PostFileVO> getPostFileList() {
        System.out.println("===> Mybatis로 getPostFileList() 기능 처리");
        return mybatis.selectList("postfileDAO.getPostFileList", null);
    }
    
    public String getGroupKey() {
    		System.out.println("===> Mybatis로 getGroupKey() 기능 처리");
    		return mybatis.selectOne("postfileDAO.selectGroupKey", null);
    }
	
}
