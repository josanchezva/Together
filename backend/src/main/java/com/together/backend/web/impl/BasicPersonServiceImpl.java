package com.together.backend.web.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.together.backend.business.inter.BasicPersonBusiness;
import com.together.backend.dto.BasicPerson;
import com.together.backend.web.inter.BasicPersonService;

@RestController
public class BasicPersonServiceImpl implements BasicPersonService {

    @Autowired
    BasicPersonBusiness basicPersonBusiness;

    @Override
    public BasicPerson createBasicPerson(BasicPerson basicPerson) throws Exception {
        System.out.println("Please enter here :C");
        BasicPerson bufferPerson = null;
        try {
            bufferPerson = basicPersonBusiness.createBasicPerson(basicPerson);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return bufferPerson;
    }
    
}
