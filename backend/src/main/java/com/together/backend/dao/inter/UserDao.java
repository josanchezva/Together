package com.together.backend.dao.inter;

import javax.annotation.Nonnull;


import com.together.backend.dto.BasicUser;
import com.together.backend.dto.OperationResponse;

public interface UserDao {
    
    public OperationResponse<BasicUser> createUser(BasicUser user) throws Exception;

    public OperationResponse<BasicUser> getUserById(@Nonnull String id)throws Exception;

    public OperationResponse<BasicUser> updateUserData(BasicUser data, String id) throws Exception;

    public OperationResponse<BasicUser> deleteUser(@Nonnull String id) throws Exception;

    public OperationResponse<BasicUser> getUserByEmail(@Nonnull String email) throws Exception;
}