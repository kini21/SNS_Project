package com.sns.reply;

import java.util.List;

public interface ReplyService {
	
	// CRUD 기능의 메소드
			// 댓글 등록
			void insertReply(ReplyVO vo);

			// 댓글 수정
			void updateReply(ReplyVO vo);

			// 댓글 삭제
			void deleteReply(ReplyVO vo);

			// 댓글 상세 조회
			ReplyVO getReply(ReplyVO vo);
			
			// 댓글 목록 조회
			List<ReplyVO> getReplyList();
			
			// 특정 게시물의 댓글 목록 조회
			List<ReplyVO> getPostReplyList(ReplyVO vo);
			
			// 댓글 수 조회
			int getReplyCount(ReplyVO vo);
}
