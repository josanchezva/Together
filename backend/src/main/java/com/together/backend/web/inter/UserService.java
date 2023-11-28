package com.together.backend.web.inter;

import javax.annotation.Nonnull;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.together.backend.dto.BasicUser;
import com.together.backend.dto.OperationResponse;


@RestController
@RequestMapping("/user")
public interface UserService {
    
    @PostMapping("/create")
    public OperationResponse<BasicUser> createUser(@RequestBody BasicUser user) throws Exception;

    @GetMapping("/get/{id}")
    public BasicUser getUserById(@Nonnull @PathVariable String id)throws Exception;

    @PutMapping("/update/{id}")
    public OperationResponse<BasicUser> updateUserData(@RequestBody BasicUser data,@Nonnull @PathVariable String id) throws Exception;

    @DeleteMapping("/delete/{id}")
    public OperationResponse<BasicUser> deleteUser(@Nonnull @PathVariable String id) throws Exception;

    @GetMapping("/get")
    public OperationResponse<BasicUser> getUserByEmail(@Nonnull @RequestParam String email) throws Exception;
}
