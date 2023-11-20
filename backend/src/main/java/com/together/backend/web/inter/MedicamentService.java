package com.together.backend.web.inter;

import javax.annotation.Nonnull;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.together.backend.dto.Medicament;
import com.together.backend.dto.OperationResponse;

@RestController
@RequestMapping("/medicament")
public interface MedicamentService {

    @PostMapping("/create")
    public OperationResponse<Medicament> registerMedicament(@RequestBody Medicament medicament) throws Exception;

    @GetMapping("/get/{id}")
    public Medicament getMedicamentById(@Nonnull @PathVariable String id) throws Exception;

    @PutMapping("/update/{id}")
    public OperationResponse<Medicament> updateMedicament(@RequestBody Medicament data, @Nonnull @PathVariable String id) throws Exception;

    @DeleteMapping("/delete/{id}")
    public OperationResponse<Medicament> deleteMedicament(@Nonnull @PathVariable String id) throws Exception;
    
}
