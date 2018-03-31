package com.sns.repository.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.reply.ReplyService;
import com.sns.reply.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO replyDAO;

	@Override
	public void insertReply(ReplyVO vo) {
		replyDAO.insertReply(vo);
	}

	@Override
	public void updateReply(ReplyVO vo) {
		replyDAO.updateReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		replyDAO.deleteReply(vo);
	}

	@Override
	public ReplyVO getReply(ReplyVO vo) {
		return replyDAO.getReply(vo);
	}

	@Override
	public List<ReplyVO> getReplyList() {
		return replyDAO.getReplyList();
	}

	@Override
	public List<ReplyVO> getPostReplyList(ReplyVO vo) {
		return replyDAO.getPostReplyList(vo);
	}

	@Override
	public int getReplyCount(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyDAO.getReplyCount(vo);
	}

}
