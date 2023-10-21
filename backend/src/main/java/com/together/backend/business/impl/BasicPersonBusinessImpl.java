package com.together.backend.business.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.together.backend.business.inter.BasicPersonBusiness;
import com.together.backend.dao.inter.BasicPersonDao;
import com.together.backend.dto.BasicPerson;

@Service
public class BasicPersonBusinessImpl implements BasicPersonBusiness{

    @Autowired
    BasicPersonDao basicPersonDao;

    @Override
    public BasicPerson createBasicPerson(BasicPerson basicPerson) throws Exception {
        BasicPerson bufferPerson = null;
        try {
            bufferPerson = basicPersonDao.createBasicPerson(basicPerson);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return bufferPerson;
    }
    
}
