package com.sns.repository.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.message.MessageService;
import com.sns.message.MessageVO;

@Service("messageService")
public class MessageServiceImpl implements MessageService{
	@Autowired
    private MessageDAO messageDAO;
	
	@Override
    public List<MessageVO> getReceiveAllMessage(MessageVO vo) {
        return messageDAO.getReceiveAllMessage(vo);
    }
	
	@Override
    public List<MessageVO> getSendAllMessage(MessageVO vo) {
        return messageDAO.getSendAllMessage(vo);
    }
	
	@Override
	public MessageVO readMessage(MessageVO vo) {
		return messageDAO.readMessage(vo);
	}
	
	@Override
	public void insertMessage(MessageVO vo) {
		messageDAO.insertMessage(vo);
	}
	
	@Override
	public void deleteMessage(MessageVO vo) {
		messageDAO.deleteMessage(vo);
	}
	
	@Override
	public void delUpdateMessage(MessageVO vo) {
		messageDAO.delUpdateMessage(vo);
	}
	
	@Override
	public List<MessageVO> getDelCheck(MessageVO vo){
		return messageDAO.getDelCheck(vo);
	}
}
