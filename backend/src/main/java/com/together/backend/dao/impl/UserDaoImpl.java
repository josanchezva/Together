package com.together.backend.dao.impl;

import java.util.Date;

import javax.annotation.Nonnull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.together.backend.dao.inter.UserDao;
import com.together.backend.dto.BasicUser;
import com.together.backend.dto.OperationResponse;
import com.together.backend.firebase.FirebaseInitializer;

@Repository
public class UserDaoImpl implements UserDao{

    @Autowired
    FirebaseInitializer fireBaseConnection;

    private static final String  COLLECTION_ID =  "User";

    @Override
    public OperationResponse<BasicUser> createUser(BasicUser user) throws Exception {
        OperationResponse<BasicUser> operationResponse = null;
        try {
            Firestore db = fireBaseConnection.getDB();

            if(user != null && user.getUserId() != null && !user.getUserId().isEmpty()){
                user.setCreationDate(new Date());
                db.collection(COLLECTION_ID).document(user.getUserId()).create(user);
                operationResponse = new OperationResponse<BasicUser>("[Created] user created successfully.", user);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to create User] in: " + UserDaoImpl.class.getSimpleName());
        }
        return operationResponse;
    }

    @Override
    public OperationResponse<BasicUser> getUserById(@Nonnull String id) throws Exception {
        BasicUser user = null;
        OperationResponse<BasicUser> operationResponse = null;
        try {
            Firestore db = fireBaseConnection.getDB();
            if(!id.isEmpty()){
                DocumentReference reference = db.collection(COLLECTION_ID).document(id);   
                ApiFuture<DocumentSnapshot> snapshot = reference.get();
                DocumentSnapshot document = snapshot.get();
                if(document.exists()){
                    user = document.toObject(BasicUser.class);
                    operationResponse = new OperationResponse<>(null, user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to fetch User] in: " + UserDaoImpl.class.getSimpleName());
        }
        return operationResponse;
    }

    @Override
    public OperationResponse<BasicUser> updateUserData(BasicUser data,String id) throws Exception {
        OperationResponse<BasicUser> operationResponse = null;
        BasicUser bufferUser = null;

        try {
            Firestore db = fireBaseConnection.getDB();
            if(data != null && id != null && !id.isEmpty()) {

                DocumentReference reference = db.collection(COLLECTION_ID).document(id); 
                bufferUser = getUserById(id).getEntity();

                ApiFuture<WriteResult> future = reference.update(
                    "firstName", (data.getFirstName() != null)? data.getFirstName() : bufferUser.getFirstName(),
                    "secondName",  (data.getSecondName() != null)? data.getSecondName() : bufferUser.getSecondName(),
                    "surname", (data.getSurname() != null)? data.getSurname() : bufferUser.getSurname(),
                    "contactPhone", (data.getContactPhone() != null)? data.getContactPhone() : bufferUser.getContactPhone(),
                    "role", (data.getRole() != null)? data.getRole() : bufferUser.getRole()
                );

                operationResponse = new OperationResponse<>("[UPDATE] User updated at: "+future.get().getUpdateTime(), getUserById(id).getEntity());
                
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to update User] in: " + UserDaoImpl.class.getSimpleName());
        }
        return operationResponse;
    }

    @Override
    public OperationResponse<BasicUser> deleteUser(@Nonnull String id) throws Exception {
        OperationResponse<BasicUser> operationResponse = null;
        try {
            Firestore db = fireBaseConnection.getDB();
            if(id != null && !id.isEmpty()) {
                DocumentReference reference = db.collection(COLLECTION_ID).document(id); 

                ApiFuture<WriteResult> future = reference.delete();
 
                operationResponse = new OperationResponse<>("[Deleted] User deleted at: "+future.get().getUpdateTime(),null);              
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to delete User] in: " + UserDaoImpl.class.getSimpleName());
        }
        return operationResponse;
    }
    

}
