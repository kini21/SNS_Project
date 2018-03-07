package com.sns.message;

import java.util.List;

public interface MessageService {
	
	List<MessageVO> getReceiveAllMessage(MessageVO vo);
	
	List<MessageVO> getSendAllMessage(MessageVO vo);
	
	MessageVO readMessage(MessageVO vo);
	
	void insertMessage(MessageVO vo);
	
	void deleteMessage(MessageVO vo);
	
	void delUpdateMessage(MessageVO vo);
	
	List<MessageVO> getDelCheck(MessageVO vo);
}
