/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.UserService;

/**
 *
 * @author amd
 */
@Service
public class JpaUserService implements UserService{

    @Autowired
    private UserRepository userRepository;
    
    @Override
    public int saveUser(User user) {
        return userRepository.saveUser(user);
    }
    
}
