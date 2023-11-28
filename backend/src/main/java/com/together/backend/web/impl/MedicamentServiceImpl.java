package com.together.backend.web.impl;

import javax.annotation.Nonnull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.together.backend.business.inter.MedicamentBusiness;
import com.together.backend.dto.Medicament;
import com.together.backend.dto.OperationResponse;
import com.together.backend.web.inter.MedicamentService;

@RestController
public class MedicamentServiceImpl implements MedicamentService {

    @Autowired
    MedicamentBusiness medicamentBusiness;

    @Override
    public OperationResponse<Medicament> registerMedicament(Medicament medicament) throws Exception {
        OperationResponse<Medicament> response = null;
        try {
            response = medicamentBusiness.registerMedicine(medicament);
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }

    @Override
    public Medicament getMedicamentById(@Nonnull String id) throws Exception {
        Medicament response = null;
        try {
            response = medicamentBusiness.getMedicineById(id);
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }

    @Override
    public OperationResponse<Medicament> updateMedicament(Medicament data, @Nonnull String id) throws Exception {
        OperationResponse<Medicament> response = null;
        try {
            response = medicamentBusiness.updateMedicine(data,id);
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }

    @Override
    public OperationResponse<Medicament> deleteMedicament(@Nonnull String id) throws Exception {
        OperationResponse<Medicament> response = null;
        try {
            response = medicamentBusiness.deleteMedicine(id);
        } catch (Exception e) {
            e.getCause();
        }
        return response;
    }
    
}
