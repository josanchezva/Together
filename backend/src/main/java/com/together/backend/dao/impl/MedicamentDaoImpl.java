package com.together.backend.dao.impl;

import javax.annotation.Nonnull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.together.backend.dao.inter.MedicamentDao;
import com.together.backend.dto.Medicament;
import com.together.backend.dto.OperationResponse;
import com.together.backend.firebase.FirebaseInitializer;

@Repository
public class MedicamentDaoImpl implements MedicamentDao {

    @Autowired
    FirebaseInitializer fireBaseConnection;

    private static final String  COLLECTION_ID =  "Medicine";

    @Override
    public OperationResponse<Medicament> registerMedicine(Medicament medicament) throws Exception {
        OperationResponse<Medicament> response = null;
        try {
            Firestore db = fireBaseConnection.getDB();
            if(medicament != null){
                String id = db.collection(COLLECTION_ID).document().getId();
                medicament.setId(id);
                db.collection(COLLECTION_ID).document(id).create(medicament);

                response = new OperationResponse<>("[Registered] Medicament registered successfully.",medicament);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to register Medicament] in: " + MedicamentDaoImpl.class.getSimpleName());
        }
        return response;
    }

    @Override
    public OperationResponse<Medicament> getMedicineById(@Nonnull String id) throws Exception {
        Medicament medicament = null;
        OperationResponse<Medicament> response = null;
        try {
            Firestore db = fireBaseConnection.getDB();
            if(!id.isEmpty()){
                DocumentReference reference = db.collection(COLLECTION_ID).document(id);
                ApiFuture<DocumentSnapshot> snapshot = reference.get();
                DocumentSnapshot document = snapshot.get();
                if(document.exists()){
                    medicament = document.toObject(Medicament.class);
                    response = new OperationResponse<>(null,medicament);
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to fetch Medicament] in: " + MedicamentDaoImpl.class.getSimpleName());
        }
        return response;

    }

    @Override
    public OperationResponse<Medicament> updateMedicine(Medicament data, String id) throws Exception {
        OperationResponse<Medicament> response = null;
        Medicament bufferMedicament = null;

        try {
            Firestore db = fireBaseConnection.getDB();
            if(data != null && id != null && !id.isEmpty()){
                DocumentReference reference = db.collection(COLLECTION_ID).document(id);
                bufferMedicament = getMedicineById(id).getEntity();

                ApiFuture<WriteResult> future = reference.update(
                    "name", (data.getName() != null)? data.getName() : bufferMedicament.getName(),
                    "comercialName",  (data.getComercialName() != null)? data.getComercialName() : bufferMedicament.getComercialName(),
                    "composition" , (data.getComposition() != null)? data.getComposition() : bufferMedicament.getComposition(),
                    "requireFormula" , (data.getRequireFormula() != null)? data.getRequireFormula() : bufferMedicament.getRequireFormula(),
                    "dosage" , (data.getDosage() != null)? data.getDosage() : bufferMedicament.getDosage(),
                    "usage" , (data.getUsage() != null)? data.getUsage() : bufferMedicament.getUsage(),
                    "pharmaceuticalLabs", (data.getPharmaceuticalLabs() != null)? data.getPharmaceuticalLabs() : bufferMedicament.getPharmaceuticalLabs()
                );

                response = new OperationResponse<>("[Updated] Medicament updated at: "+future.get().getUpdateTime(), getMedicineById(id).getEntity());

            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to update Medicament] in: " + MedicamentDaoImpl.class.getSimpleName());
        }
        return response;
    }

    @Override
    public OperationResponse<Medicament> deleteMedicine(@Nonnull String id) throws Exception {
        OperationResponse<Medicament> response = null;
        try {
            Firestore db = fireBaseConnection.getDB();
            if(!id.isEmpty()){
                DocumentReference reference = db.collection(COLLECTION_ID).document(id);
                ApiFuture<WriteResult> future = reference.delete();
                response = new OperationResponse<>("[Deleted] Medicament deleted at: "+future.get().getUpdateTime(),null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("ERROR [Unable to delete Medicament] in: " + MedicamentDaoImpl.class.getSimpleName());
        }
        return response;
    }
    
}
