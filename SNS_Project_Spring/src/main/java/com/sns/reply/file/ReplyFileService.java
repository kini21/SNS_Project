package com.sns.reply.file;

import java.util.List;

public interface ReplyFileService {

	// CRUD 기능의 메소드
				// 포스트 파일 등록
				void insertReplyFile(ReplyFileVO vo);

				// 포스트 파일 삭제
				void deleteReplyFile(ReplyFileVO vo);

				// 포스트 파일 상세 목록 조회
				List<ReplyFileVO> getReplyFile(ReplyFileVO vo);
				
				// 그룹키 생성
				String getGroupKey();
				
}
