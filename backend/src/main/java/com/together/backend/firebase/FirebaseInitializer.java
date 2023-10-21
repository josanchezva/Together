package com.together.backend.firebase;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.cloud.FirestoreClient;

@Configuration
public class FirebaseInitializer {

    private FirebaseApp app;
    private Firestore db;

    @PostConstruct
    public void initialize() throws Exception {
        try {
            InputStream serviceAccount = new FileInputStream("./src/main/resources/static/serviceAccountKey.json");

            GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);

            FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(credentials)
                .setProjectId("together-2de05")
                .setDatabaseUrl("default")
                .build();
           
            if (app == null){
                app = FirebaseApp.initializeApp(options);
            }
            
            db = FirestoreClient.getFirestore();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Firestore getDB(){
        return db;
    }
}
