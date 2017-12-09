package com.sns.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sns.repository.CommonDao;

@Service
public class testService {

	@Autowired
	private CommonDao dao;
	
	@Transactional
	public List test() {
		return dao.selectList("users.selectAll", null);
	}
}
