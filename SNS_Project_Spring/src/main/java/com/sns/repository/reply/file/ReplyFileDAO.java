package com.sns.repository.reply.file;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.reply.file.ReplyFileVO;

@Repository("replyfileDAO")
public class ReplyFileDAO {
	
	@Autowired
    private SqlSessionTemplate mybatis;
	
	public void insertReplyFile(ReplyFileVO vo) {
        System.out.println("===> Mybatis로 insertReplyFile() 기능 처리");
        mybatis.insert("replyfileDAO.insertReplyFile", vo);
    }

    public void deleteReplyFile(ReplyFileVO vo) {
        System.out.println("===> Mybatis로 deleteReplyFile() 기능 처리");
        mybatis.delete("replyfileDAO.deleteReplyFile", vo);
    }

    public List<ReplyFileVO> getReplyFile(ReplyFileVO vo) {
        System.out.println("===> Mybatis로 getReplyFile() 기능 처리");
        return mybatis.selectList("replyfileDAO.getReplyFile", vo);
    }
    
    public String getGroupKey() {
    		System.out.println("===> Mybatis로 getGroupKey() 기능 처리");
    		return mybatis.selectOne("replyfileDAO.selectGroupKey", null);
    }

}
