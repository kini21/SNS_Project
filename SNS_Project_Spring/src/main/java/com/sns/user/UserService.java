package com.sns.user;

import java.util.List;
import com.sns.user.UserVO;

public interface UserService {

	// CRUD 기능의 메소드
	// 글 등록
	void insertUser(UserVO vo);

	// 글 수정
	void updateUser(UserVO vo);

	// 글 삭제
	void deleteUser(UserVO vo);

	// 글 상세 조회
	UserVO getUser(UserVO vo);

	// 글 목록 조회
	List<UserVO> getUserList(UserVO vo);
}
