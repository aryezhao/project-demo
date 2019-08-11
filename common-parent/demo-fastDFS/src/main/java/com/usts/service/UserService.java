package com.usts.service;

import com.usts.entity.User;

import java.util.List;

/**
 * Created by lenovo on 2019/8/7.
 */
public interface UserService {

    List<User> findAll();

    void addUser(User user);
}
