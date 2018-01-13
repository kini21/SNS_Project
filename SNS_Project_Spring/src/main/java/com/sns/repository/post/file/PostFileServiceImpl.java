package com.sns.repository.post.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.post.file.PostFileService;
import com.sns.post.file.PostFileVO;

@Service("postfileService")
public class PostFileServiceImpl implements PostFileService {
	
	@Autowired
	PostFileDAO postfileDAO;

	@Override
	public void insertPostFile(PostFileVO vo) {
		postfileDAO.insertPostFile(vo);
	}

	@Override
	public void deletePostFile(PostFileVO vo) {
		postfileDAO.deletePostFile(vo);
	}

	@Override
	public PostFileVO getPostFile(PostFileVO vo) {
		return postfileDAO.getPostFile(vo);
	}

	@Override
	public List<PostFileVO> getPostFileList() {
		return postfileDAO.getPostFileList();
	}

	@Override
	public String getGroupKey() {
		return postfileDAO.getGroupKey();
	}

}
