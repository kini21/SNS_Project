package com.sns.repository.message;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.message.MessageVO;

@Repository("messageDAO")
public class MessageDAO {
	@Autowired
    private SqlSessionTemplate mybatis;
	
	public List<MessageVO> getReceiveAllMessage(Map<String, Object> map) {
		System.out.println("===> Mybatis로 getReceiveAllMessage() 기능 처리");
        return mybatis.selectList("messageDAO.receiveAllMessage", map);
    }
	
	public List<MessageVO> getSendAllMessage(Map<String, Object> map) {
		System.out.println("===> Mybatis로 getSendAllMessage() 기능 처리");
        return mybatis.selectList("messageDAO.sendAllMessage", map);
    }
	
	public int getMsgCount(MessageVO vo) {
		System.out.println("===> Mybatis로 getMsgCount() 기능 처리");
		
		if(vo.getFrom_uid() > 0) {
			return mybatis.selectOne("messageDAO.sendMsgCount", vo);
		} else {
			return mybatis.selectOne("messageDAO.receiveMsgCount", vo);
		}
	}
	
	public MessageVO readMessage(MessageVO vo) {
		System.out.println("===> Mybatis로 readMessage() 기능 처리");
		return mybatis.selectOne("messageDAO.readMessage", vo);
	}
	
	public void insertMessage(MessageVO vo) {
        System.out.println("===> Mybatis로 insertMessage() 기능 처리");
        mybatis.insert("messageDAO.insertMessage", vo);
    }
	
	public void deleteMessage(MessageVO vo) {
        System.out.println("===> Mybatis로 deleteMessage() 기능 처리");
        mybatis.insert("messageDAO.deleteMessage", vo);
    }
	
	public void delUpdateMessage(MessageVO vo) {
		System.out.println("===> Mybatis로 delUpdateMessage() 기능 처리");
		mybatis.update("messageDAO.delUpdateMessage",vo);
	}
	
	public List<MessageVO> getDelCheck(MessageVO vo){
		System.out.println("===> Mybatis로 getDelCheck() 기능 처리");
		return mybatis.selectList("messageDAO.getDelCheck", vo);
	}
}
