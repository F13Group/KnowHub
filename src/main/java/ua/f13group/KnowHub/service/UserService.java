/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.domain.User;

/**
 *
 * @author amd
 */

public interface UserService {
    public Integer saveUser(User user);
    public Integer confirmUser(String userlink);
    public User getUserByLogin(String login);
}
