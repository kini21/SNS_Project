package com.sns.post.file;

import java.util.List;
import com.sns.post.file.PostFileVO;

public interface PostFileService {

	// CRUD 기능의 메소드
			// 포스트 파일 등록
			void insertPostFile(PostFileVO vo);

			// 포스트 파일 삭제
			void deletePostFile(PostFileVO vo);

			// 포스트 파일 상세 조회
			PostFileVO getPostFile(PostFileVO vo);
			
			// 포스트 파일 목록 조회
			List<PostFileVO> getPostFileList();
			
			// 그룹키 생성
			String getGroupKey();
			
}
