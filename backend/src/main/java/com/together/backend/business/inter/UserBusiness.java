package com.together.backend.business.inter;

import javax.annotation.Nonnull;

import com.together.backend.dto.BasicUser;
import com.together.backend.dto.OperationResponse;

public interface UserBusiness {
    
    public OperationResponse<BasicUser> createUser(BasicUser user) throws Exception;

    public BasicUser getUserById(@Nonnull String id)throws Exception;

    public OperationResponse<BasicUser> updateUserData(BasicUser data, String id) throws Exception;

    public OperationResponse<BasicUser> deleteUser(@Nonnull String id) throws Exception;

    public OperationResponse<BasicUser> getUserByEmail(@Nonnull String email) throws Exception;
    
}
