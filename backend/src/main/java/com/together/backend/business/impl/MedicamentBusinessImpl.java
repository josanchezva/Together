package com.together.backend.business.impl;

import javax.annotation.Nonnull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.together.backend.business.inter.MedicamentBusiness;
import com.together.backend.dao.inter.MedicamentDao;
import com.together.backend.dto.Medicament;
import com.together.backend.dto.OperationResponse;

@Service
public class MedicamentBusinessImpl implements MedicamentBusiness{

    @Autowired
    MedicamentDao medicamentDao;

    @Override
    public OperationResponse<Medicament> registerMedicine(Medicament medicament) throws Exception {
        OperationResponse<Medicament> operation = null;
        try {
            operation = medicamentDao.registerMedicine(medicament);
        } catch (Exception e) {
            e.getMessage();
        }
        return operation;
    }

    @Override
    public Medicament getMedicineById(@Nonnull String id) throws Exception {
        OperationResponse<Medicament> operation = null;
        try {
            operation = medicamentDao.getMedicineById(id);
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
    public OperationResponse<Medicament> updateMedicine(Medicament data, String id) throws Exception {
        OperationResponse<Medicament> operation = null;
        try {
            operation = medicamentDao.updateMedicine(data,id);
        } catch (Exception e) {
            e.getMessage();
        }
        return operation;
    }

    @Override
    public OperationResponse<Medicament> deleteMedicine(@Nonnull String id) throws Exception {
        OperationResponse<Medicament> operation = null;
        try {
            operation = medicamentDao.deleteMedicine(id);
        } catch (Exception e) {
            e.getMessage();
        }
        return operation;
    }
    
}
