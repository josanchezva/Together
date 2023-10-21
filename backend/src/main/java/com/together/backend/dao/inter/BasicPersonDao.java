package com.together.backend.dao.inter;

import com.together.backend.dto.BasicPerson;

public interface BasicPersonDao {
    
    public BasicPerson createBasicPerson(BasicPerson basicPerson) throws Exception;
}