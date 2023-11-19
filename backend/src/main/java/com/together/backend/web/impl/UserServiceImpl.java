package com.together.backend.web.impl;

import javax.annotation.Nonnull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.together.backend.business.inter.UserBusiness;
import com.together.backend.dto.BasicUser;
import com.together.backend.dto.OperationResponse;
import com.together.backend.web.inter.UserService;

@RestController
public class UserServiceImpl implements UserService {

    @Autowired
    UserBusiness basicPersonBusiness;

    @Override
    public OperationResponse<BasicUser> createUser(@RequestBody BasicUser user) throws Exception {
        OperationResponse<BasicUser> response = null;
        try {
            response = basicPersonBusiness.createUser(user);
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }

    @Override
    public BasicUser getUserById(@Nonnull String id) throws Exception {
        BasicUser user = null;
        try {
            user = basicPersonBusiness.getUserById(id);
        } catch (Exception e) {
            e.getCause();
        }
        return user;
    }

    @Override
    public OperationResponse<BasicUser> updateUserData(BasicUser data, @Nonnull String id) throws Exception {
        OperationResponse<BasicUser> response = null;
        try {
            if(data != null){
                response = basicPersonBusiness.updateUserData(data,id);
            }
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }

    @Override
    public OperationResponse<BasicUser> deleteUser(@Nonnull String id) throws Exception {
        OperationResponse<BasicUser> response = null;
        try {
            response = basicPersonBusiness.deleteUser(id);
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }
    
    
}
