package com.sns.post;

import java.util.List;
import com.sns.post.PostVO;

public interface PostService {
	
	// CRUD 기능의 메소드
		// 포스트 등록
		void insertPost(PostVO vo);

		// 포스트 수정
		void updatePost(PostVO vo);

		// 포스트 삭제
		void deletePost(PostVO vo);

		// 포스트 상세 조회
		PostVO getPost(PostVO vo);
		
		// 포스트 목록 조회
		List<PostVO> getPostList();
		
		// 특정 유저의 포스트 목록 조회
		List<PostVO> getUserPostList(PostVO vo);

}
