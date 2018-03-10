package com.sns.message;

import java.util.List;
import java.util.Map;

public interface MessageService {
	
	List<MessageVO> getReceiveAllMessage(Map<String, Object> map);
	
	List<MessageVO> getSendAllMessage(Map<String, Object> map);
	
	int getMsgCount(MessageVO vo);
	
	MessageVO readMessage(MessageVO vo);
	
	void insertMessage(MessageVO vo);
	
	void deleteMessage(MessageVO vo);
	
	void delUpdateMessage(MessageVO vo);
	
	List<MessageVO> getDelCheck(MessageVO vo);
}
