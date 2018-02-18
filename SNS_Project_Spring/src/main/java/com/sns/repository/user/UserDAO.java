package com.sns.repository.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sns.user.UserVO;

@Repository("userDAO")
public class UserDAO {
    @Autowired
    private SqlSessionTemplate mybatis;

    public void insertUser(UserVO vo) {
        System.out.println("===> Mybatis로 insertUser() 기능 처리");
        mybatis.insert("userDAO.insertUser", vo);
    }

    public void updateUser(UserVO vo) {
        System.out.println("===> Mybatis로 updateUser() 기능 처리");
        mybatis.update("userDAO.updateUser", vo);
    }

    public void deleteUser(UserVO vo) {
        System.out.println("===> Mybatis로 deleteUser() 기능 처리");
        mybatis.delete("userDAO.deleteUser", vo);
    }

    public UserVO getUser(UserVO vo) {
        System.out.println("===> Mybatis로 getUser() 기능 처리");
        return mybatis.selectOne("userDAO.getUser", vo);
    }
    
    public List<UserVO> getUserList(String searchKeyword) {
        System.out.println("===> Mybatis로 getUserList() 기능 처리");
        return mybatis.selectList("userDAO.getUserList", searchKeyword);
    }
    
    public int getExistUserId(String loginid) {
    	System.out.println("===> Mybatis로 getExistUserId() 기능 처리");
        return mybatis.selectOne("userDAO.existUserId", loginid);
    }
    
    public int getExistUserEmail(String email) {
    	System.out.println("===> Mybatis로 getExistUserEmail() 기능 처리");
        return mybatis.selectOne("userDAO.existUserEmail", email);
    }
    
    public UserVO getFindIDPW(UserVO vo) {
        System.out.println("===> Mybatis로 getFindIDPW() 기능 처리");
        return mybatis.selectOne("userDAO.getFindIDPW", vo);
    }
}
