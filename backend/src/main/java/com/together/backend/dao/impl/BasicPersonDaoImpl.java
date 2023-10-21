package com.together.backend.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.together.backend.dao.inter.BasicPersonDao;
import com.together.backend.dto.BasicPerson;
import com.together.backend.firebase.FirebaseInitializer;

@Repository
public class BasicPersonDaoImpl implements BasicPersonDao{

    @Autowired
    FirebaseInitializer fireBaseConnection;

    private static final String  COLLECTION_ID =  "BasicPerson";

    @Override
    public BasicPerson createBasicPerson(BasicPerson basicPerson) throws Exception {
        BasicPerson bufferPerson = null;
        try {
            Firestore db = fireBaseConnection.getDB();
            String id = db.collection(COLLECTION_ID).document().getId();

            if(basicPerson != null && !id.isEmpty()){
                bufferPerson = new BasicPerson();

                bufferPerson.setId(id);
                bufferPerson.setDocument(basicPerson.getDocument());

                ApiFuture<WriteResult> future = db.collection(COLLECTION_ID).document(id).create(bufferPerson);
                System.out.println("CREATED [BasicPerson] At: " + future.get().getUpdateTime());
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to create BasicPerson] in: " + BasicPersonDaoImpl.class.getSimpleName());
        }
        return bufferPerson;
    }
    
}
