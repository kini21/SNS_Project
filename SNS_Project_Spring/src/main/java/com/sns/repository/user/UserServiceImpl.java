package com.sns.repository.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.UserService;
import com.sns.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;
    
    @Override
    public void insertUser(UserVO vo) {
        userDAO.insertUser(vo);
    }
    
    @Override
    public void updateUser(UserVO vo) {
    		userDAO.updateUser(vo);
    }
    
    @Override
    public void deleteUser(UserVO vo) {
    		userDAO.deleteUser(vo);
    }
    
    @Override
    public UserVO getUser(UserVO vo) {
        return userDAO.getUser(vo);
    }
    
    @Override
    public List<UserVO> getUserList(UserVO vo) {
        return userDAO.getUserList(vo);
    }
}
