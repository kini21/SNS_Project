package com.sns.repository.reply.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.reply.file.ReplyFileService;
import com.sns.reply.file.ReplyFileVO;

@Service("replyfileService")
public class ReplyFileServiceImpl implements ReplyFileService {
	
	@Autowired
	ReplyFileDAO replyfileDAO;

	@Override
	public void insertReplyFile(ReplyFileVO vo) {
		replyfileDAO.insertReplyFile(vo);
	}

	@Override
	public void deleteReplyFile(ReplyFileVO vo) {
		replyfileDAO.deleteReplyFile(vo);
	}

	@Override
	public List<ReplyFileVO> getReplyFile(ReplyFileVO vo) {
		return replyfileDAO.getReplyFile(vo);
	}

	@Override
	public String getGroupKey() {
		return replyfileDAO.getGroupKey();
	}

}
