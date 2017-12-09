package com.sns.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao {
   
	/*@Autowired
    SqlSessionTemplate dao;*/
	
	@Autowired
	SqlSession dao;
	
	public Map<String, Object> selectOne(String statement, Map<String, Object> condition) {
        return dao.selectOne(statement, condition);
    }
	
	public int selectInt(String statement, Map<String, Object> condition) {
        return dao.selectOne(statement, condition);
    }
	
	public String selectStr(String statement, Map<String, Object> condition) {
        return dao.selectOne(statement, condition);
    }
    
    public List<Map<String, Object>> selectList(String statement, Map<String, Object> condition) {
        return dao.selectList(statement, condition);
    }
    
    public int insert(String statement, Map<String, Object> condition) {
        return dao.insert(statement, condition);
    }
    
    public int update(String statement, Map<String, Object> condition) {
        return dao.update(statement, condition);
    }
    
    public int delete(String statement, Map<String, Object> condition) {
        return dao.delete(statement, condition);
    }

    public Map<String, Object> doLogin(String statement, Map<String, Object> condition) {
    		return dao.selectOne(statement, condition);
    }
}