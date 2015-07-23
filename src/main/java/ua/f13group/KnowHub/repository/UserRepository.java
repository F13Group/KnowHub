/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.repository;

import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.User;

/**
 *
 * @author amd
 */
public interface UserRepository {
    public Integer saveUser(User user);
    public Confirmation getConfirmationByLink(String link);
    public User getUserByLogin(String login);
    public void saveConfirmation(Confirmation confirm);
    public void deleteConfirmation(Confirmation confirm);
	public void deleteUser(User newUser);
	public Confirmation getConfirmationByUserId(Long userId);
	public Confirmation getConfirmationByUserLogin(String login);
		
}
