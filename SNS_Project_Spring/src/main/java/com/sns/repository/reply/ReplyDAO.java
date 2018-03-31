package com.sns.repository.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.reply.ReplyVO;

@Repository("replyDAO")
public class ReplyDAO {
	
	@Autowired
    private SqlSessionTemplate mybatis;

    public void insertReply(ReplyVO vo) {
        System.out.println("===> Mybatis로 insertReply() 기능 처리");
        mybatis.insert("replyDAO.insertReply", vo);
    }

    public void updateReply(ReplyVO vo) {
        System.out.println("===> Mybatis로 updateReply() 기능 처리");
        mybatis.update("replyDAO.updateReply", vo);
    }

    public void deleteReply(ReplyVO vo) {
        System.out.println("===> Mybatis로 deleteReply() 기능 처리");
        mybatis.delete("replyDAO.deleteReply", vo);
    }

    public ReplyVO getReply(ReplyVO vo) {
        System.out.println("===> Mybatis로 getReply() 기능 처리");
        return mybatis.selectOne("replyDAO.getReply", vo);
    }
    
    public List<ReplyVO> getReplyList() {
        System.out.println("===> Mybatis로 getReplyList() 기능 처리");
        return mybatis.selectList("replyDAO.getReplyList", null);
    }
    
    public List<ReplyVO> getPostReplyList(ReplyVO vo) {
        System.out.println("===> Mybatis로 getPostReplyList() 기능 처리");
        return mybatis.selectList("replyDAO.getPostReplyList", vo);
    }
    
    public int getReplyCount(ReplyVO vo) {
        System.out.println("===> Mybatis로 getReplyCount() 기능 처리");
        return mybatis.selectOne("replyDAO.getReplyCount", vo);
    }

}
