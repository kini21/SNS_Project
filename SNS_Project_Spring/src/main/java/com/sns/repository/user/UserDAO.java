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
        mybatis.insert("UserDAO.insertUser", vo);
    }

    public void updateUser(UserVO vo) {
        System.out.println("===> Mybatis로 updateUser() 기능 처리");
        mybatis.update("UserDAO.updateUser", vo);
    }

    public void deleteUser(UserVO vo) {
        System.out.println("===> Mybatis로 deleteUser() 기능 처리");
        mybatis.delete("UserDAO.deleteUser", vo);
    }

    public UserVO getUser(UserVO vo) {
        System.out.println("===> Mybatis로 getUser() 기능 처리");
        return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
    }
    
    public List<UserVO> getUserList(UserVO vo) {
        System.out.println("===> Mybatis로 getUserList() 기능 처리");
        return mybatis.selectList("UserDAO.getUserList", vo);
    }
}
