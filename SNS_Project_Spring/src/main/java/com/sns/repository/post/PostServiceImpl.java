package com.sns.repository.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.post.PostService;
import com.sns.post.PostVO;

@Service("postService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	PostDAO postDAO;

	@Override
	public void insertPost(PostVO vo) {
		postDAO.insertPost(vo);
	}

	@Override
	public void updatePost(PostVO vo) {
		postDAO.updatePost(vo);
	}

	@Override
	public void deletePost(PostVO vo) {
		postDAO.deletePost(vo);
	}

	@Override
	public PostVO getPost(PostVO vo) {
		return postDAO.getPost(vo);
	}

	@Override
	public List<PostVO> getPostList() {
		return postDAO.getPostList();
	}

}
