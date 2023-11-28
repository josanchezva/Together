package com.together.backend.business.impl;

import javax.annotation.Nonnull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.together.backend.business.inter.UserBusiness;
import com.together.backend.dao.inter.UserDao;
import com.together.backend.dto.BasicUser;
import com.together.backend.dto.OperationResponse;

@Service
public class UserBusinessImpl implements UserBusiness{

    @Autowired
    UserDao basicPersonDao;

    @Override
    public OperationResponse<BasicUser> createUser(BasicUser user) throws Exception {
        OperationResponse<BasicUser> operation = null;
        try {
            operation = basicPersonDao.createUser(user);
        } catch (Exception e) {
            e.getMessage();
        }
        return operation;
    }

    @Override
    public BasicUser getUserById(@Nonnull String id) throws Exception {
        OperationResponse<BasicUser> operation = null;
        try {
            operation = basicPersonDao.getUserById(id);
        } catch (Exception e) {
            e.getMessage();
        }

        if(operation != null){
            return operation.getEntity();
        }else{
            return null;
        }
    }

    @Override
    public OperationResponse<BasicUser> updateUserData(BasicUser data, String id) throws Exception {
        OperationResponse<BasicUser> operation = null;
        try {
            operation = basicPersonDao.updateUserData(data,id);
        } catch (Exception e) {
            e.getMessage();
        }
        return operation;
    }

    @Override
    public OperationResponse<BasicUser> deleteUser(@Nonnull String id) throws Exception {
        OperationResponse<BasicUser> operation = null;
        try {
            operation = basicPersonDao.deleteUser(id);
        } catch (Exception e) {
            e.getMessage();
        }
        return operation;
    }

    @Override
    public OperationResponse<BasicUser> getUserByEmail(@Nonnull String email) throws Exception {
        OperationResponse<BasicUser> operation = null;
        try {
            operation = basicPersonDao.getUserByEmail(email);
        } catch (Exception e) {
            e.getMessage();
        }

        if(operation != null){
            return operation;
        }else{
            return null;
        }
    }
    
}
