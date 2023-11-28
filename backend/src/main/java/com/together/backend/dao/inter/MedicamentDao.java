package com.together.backend.dao.inter;

import javax.annotation.Nonnull;

import com.together.backend.dto.Medicament;
import com.together.backend.dto.OperationResponse;

public interface MedicamentDao {
    
    public OperationResponse<Medicament> registerMedicine(Medicament medicament) throws Exception;

    public OperationResponse<Medicament> getMedicineById(@Nonnull String id)throws Exception;

    public OperationResponse<Medicament> updateMedicine(Medicament data, String id) throws Exception;

    public OperationResponse<Medicament> deleteMedicine(@Nonnull String id) throws Exception;
}
